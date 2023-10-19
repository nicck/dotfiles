curl -SL -O https://github.com/nushell/nushell/releases/download/0.86.0/nu-0.86.0-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xf nu-0.86.0-x86_64-unknown-linux-gnu.tar.gz \
    && sudo cp nu-0.86.0-x86_64-unknown-linux-gnu/nu /usr/local/bin/ \
    && rm nu-0.86.0-x86_64-unknown-linux-gnu.tar.gz \
    && rm -r nu-0.86.0-x86_64-unknown-linux-gnu

curl -sS -o install-starship.sh https://starship.rs/install.sh \
    && chmod +x ./install-starship.sh \
    && sudo ./install-starship.sh -y \
    && rm ./install-starship.sh

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

nu -e '"\nalias ll = exa -a -lbF --git\n" | save --append $nu.config-path; exit'

curl -SL -O https://github.com/abs-lang/abs/releases/download/2.6.0/abs-linux-amd64 \
    && chmod +x abs-linux-amd64 \
    && sudo mv abs-linux-amd64 /usr/local/bin/abs

curl -SL -O https://nojs.murex.rocks/bin/latest/murex-linux-amd64.gz \
    && gunzip murex-linux-amd64.gz \
    && chmod +x murex-linux-amd64 \
    && sudo mv murex-linux-amd64 /usr/local/bin/murex

curl -SL -O https://github.com/Nukesor/pueue/releases/download/v3.1.2/pueue-linux-x86_64 \
    && chmod +x pueue-linux-x86_64 \
    && sudo mv pueue-linux-x86_64 /usr/local/bin/pueue

curl -SL -O https://github.com/Nukesor/pueue/releases/download/v3.1.2/pueued-linux-x86_64 \
    && chmod +x pueued-linux-x86_64 \
    && sudo mv pueued-linux-x86_64 /usr/local/bin/pueued

curl -SL -O https://github.com/upx/upx/releases/download/v4.1.0/upx-4.1.0-amd64_linux.tar.xz \
    && tar -xf upx-4.1.0-amd64_linux.tar.xz \
    && sudo cp upx-4.1.0-amd64_linux/upx /usr/local/bin/ \
    && rm upx-4.1.0-amd64_linux.tar.xz \
    && rm -r upx-4.1.0-amd64_linux

curl -LO https://fossil-scm.org/home/uv/fossil-linux-x64-2.22.tar.gz \
    && tar -xaf fossil-linux-x64-2.22.tar.gz \
    && sudo mv fossil /usr/local/bin/
