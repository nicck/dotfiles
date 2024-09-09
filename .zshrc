# Check if locale-gen is available
if ! command -v locale-gen &> /dev/null; then
    # Install locales package if locale-gen is missing
    sudo apt-get update && sudo apt-get install -y locales
fi

# Check if the locale is already generated
if ! locale -a | grep -qi 'en_US.UTF'; then
    # Generate the locale if it's missing
    sudo locale-gen en_US.UTF-8
fi

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Download Znap, if it's not there yet.
[[ -f ~/.dotfiles/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 --branch '22.06.22' -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.dotfiles/zsh-snap

source ~/.dotfiles/zsh-snap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
# znap source marlonrichert/zsh-autocomplete
znap source ptavares/zsh-exa
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

alias ll='exa -a -lbF --git'
