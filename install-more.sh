curl -SL -O https://github.com/nushell/nushell/releases/download/0.85.0/nu-0.85.0-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xf nu-0.85.0-x86_64-unknown-linux-gnu.tar.gz \
    && sudo cp nu-0.85.0-x86_64-unknown-linux-gnu/nu /usr/local/bin/ \
    && rm nu-0.85.0-x86_64-unknown-linux-gnu.tar.gz

curl -sS -o install-starship.sh https://starship.rs/install.sh \
    && chmod +x ./install-starship.sh \
    && sudo ./install-starship.sh -y

starship preset pure-preset -o ~/.config/starship.toml

mkdir -p ~/.cache/starship
starship init nu > ~/.cache/starship/init.nu

nu -e '"\nuse ~/.cache/starship/init.nu\n" | save --append $nu.config-path; exit'

curl -SL -O https://github.com/rsteube/carapace-bin/releases/download/v0.27.0/carapace-bin_linux_amd64.tar.gz \
    && tar -xf carapace-bin_linux_amd64.tar.gz \
    && sudo mv carapace /usr/local/bin/ \
    && rm carapace-bin_linux_amd64.tar.gz

mkdir -p ~/.cache/carapace
carapace _carapace nushell > ~/.cache/carapace/init.nu

nu -e '"\nsource ~/.cache/carapace/init.nu\n" | save --append $nu.config-path; exit'

nu -e '"\nalias ll = ls -a\n" | save --append $nu.config-path; exit'
