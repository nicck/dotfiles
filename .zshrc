# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Download Znap, if it's not there yet.
[[ -f ~/.dotfiles/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
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
