def keep_branches_config
  branches = `git config --get 'remove-branch.keep'`
    .split(/[\s,]/)
    .select { |b| !b.empty? }

  if branches.empty?
    `git config --add 'remove-branch.keep' 'master, production'`

    puts "Configuration added to .git/config"
    puts %{
      [remove-branch]
        keep = master, production
    }

    branches = %w(master production)
  end

  branches
end

def get_current_branch(local_branches)
  local_branches
    .find { |l| l.includes?("* ") }
    .to_s
    .sub(/\A\* /, "")
end

def sync_remote_branches
  `git remote prune origin`
end

def get_remote_branches(keep_branches)
  `git branch -r --merged`
    .lines
    .map(&.strip)
end

def get_local_branches(keep_branches)
  `git branch --merged`
    .lines
    .map(&.strip)
end

def remove_remote_branches(branches)
  branches.map do |branch|
    # TODO: now it works only with origin
    future { system "git push origin %s" % branch.sub("origin/", ":") }
  end
end

def remove_local_branches(branches)
  branches.each do |branch|
    system "git branch -d #{branch}"
  end
end

# `git remote prune origin`

keep_branches = keep_branches_config

remote_branches = future {
  sync_remote_branches
  get_remote_branches(keep_branches)
}

local_branches = future { get_local_branches(keep_branches) }

remote_branches_to_remove = remote_branches.get
  .reject { |l| keep_branches.any? { |branch| l.includes?("/#{branch}") } }

local_branches = local_branches.get
local_branches_to_remove = local_branches
  .reject { |l| keep_branches.any? { |branch| l.sub(/\A\* /, "") == branch || l.includes?("* ") } }

current_branch = get_current_branch(local_branches)

if current_branch.empty?
  puts "Can not detect current branch."
  exit 1
end

unless current_branch == "master"
  puts
  puts "WARNING: You are on branch #{current_branch}, NOT master."
  puts
end

if remote_branches_to_remove.empty? && local_branches_to_remove.empty?
  puts "No existing branches have been merged into #{current_branch}."
  exit
end

puts "This will remove the following branches:"
puts

if remote_branches_to_remove.any?
  puts remote_branches_to_remove.join "\n"
  puts
end

if local_branches_to_remove.any?
  puts local_branches_to_remove.join "\n"
  puts
end

print "Continue? (Y/n): "
choice = gets.to_s.strip
puts

if choice.downcase == "n"
  puts "No branches removed."
  exit 0
end

remove_local_branches(local_branches_to_remove)
remove_remote_branches(remote_branches_to_remove).each(&.get)

puts "Branches removed"

exit 0
