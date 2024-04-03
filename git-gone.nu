#!/usr/bin/env nu

# gently try to delete merged branches, excluding the checked out one
git branch --merged | lines | where $it !~ '\*' | str trim | where $it != 'master' and $it != 'main' | each { |it| git branch -d $it }

git remote prune origin
git branch -r --merged | lines | where $it !~ '\/HEAD' | str trim | where $it != 'origin/master' and $it != 'origin/main' | str replace 'origin/' '' | par-each { |it| git push origin --delete $it }
