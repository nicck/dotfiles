curl -SL -O https://github.com/nushell/nushell/releases/download/0.92.0/nu-0.92.0-x86_64-unknown-linux-musl.tar.gz \
    && tar -xf nu-0.92.0-x86_64-unknown-linux-musl.tar.gz \
    && sudo cp nu-0.92.0-x86_64-unknown-linux-musl/nu /usr/local/bin/ \
    && rm nu-0.92.0-x86_64-unknown-linux-musl.tar.gz \
    && rm -r nu-0.92.0-x86_64-unknown-linux-musl

curl -sS -o install-starship.sh https://starship.rs/install.sh \
    && chmod +x ./install-starship.sh \
    && sudo ./install-starship.sh -y \
    && rm ./install-starship.sh

starship preset pure-preset -o ~/.config/starship.toml

mkdir -p ~/.cache/starship
starship init nu > ~/.cache/starship/init.nu

nu -e '"\nuse ~/.cache/starship/init.nu\n" | save --append $nu.config-path; exit'

curl -SL -O https://github.com/carapace-sh/carapace-bin/releases/download/v1.0.0/carapace-bin_linux_amd64.tar.gz \
    && tar -xf carapace-bin_linux_amd64.tar.gz \
    && sudo mv carapace /usr/local/bin/ \
    && rm carapace-bin_linux_amd64.tar.gz

mkdir -p ~/.cache/carapace
carapace _carapace nushell > ~/.cache/carapace/init.nu

nu -e '"\nsource ~/.cache/carapace/init.nu\n" | save --append $nu.config-path; exit'

nu -e '"\nalias ll = exa -a -lbF --git\n" | save --append $nu.config-path; exit'
# nu -e '"\ndef ll [] { ls | sort-by type }\n" | save --append $nu.config-path; exit'

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

curl -LO https://github.com/martinvonz/jj/releases/download/v0.15.1/jj-v0.15.1-x86_64-unknown-linux-musl.tar.gz \
    && mkdir jj-linux-musl \
    && tar -xaf jj-v0.15.1-x86_64-unknown-linux-musl.tar.gz -C jj-linux-musl \
    && sudo mv jj-linux-musl/jj /usr/local/bin/ \
    && rm -r jj-linux-musl

curl -LO https://github.com/Wilfred/difftastic/releases/download/0.57.0/difft-x86_64-unknown-linux-gnu.tar.gz \
    && mkdir tmp \
    && tar -xaf difft-x86_64-unknown-linux-gnu.tar.gz -C tmp \
    && sudo mv tmp/difft /usr/local/bin/ \
    && rm difft-x86_64-unknown-linux-gnu.tar.gz \
    && rm -r tmp

curl -LO https://github.com/extrawurst/gitui/releases/download/v0.27.0/gitui-linux-x86_64.tar.gz \
    && mkdir gitui \
    && tar -xaf gitui-linux-x86_64.tar.gz -C gitui
    && sudo mv gitui/gitui /usr/local/bin/ \
    && rm gitui-linux-x86_64.tar.gz \
    && rm -r gitui

curl -LO https://github.com/pyaillet/doggy/releases/download/v0.5.2/doggy-0.5.2-linux-amd64.tar.gz \
    && tar xf doggy-0.5.2-linux-amd64.tar.gz \
    && sudo mv doggy /usr/local/bin/ \
    && rm doggy-0.5.2-linux-amd64.tar.gz

curl -LO https://github.com/wagoodman/dive/releases/download/v0.12.0/dive_0.12.0_linux_amd64.tar.gz \
    && tar -zxvf dive_0.12.0_linux_amd64.tar.gz dive \
    && sudo mv dive /usr/local/bin/ \
    && rm dive_0.12.0_linux_amd64.tar.gz

curl -LO https://dystroy.org/broot/download/x86_64-linux/broot \
    && chmod +x broot \
    && sudo mv broot /usr/local/bin/
