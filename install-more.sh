# eget

curl -o eget.sh https://zyedidia.github.io/eget.sh
if echo "0e64b8a3c13f531da005096cc364ac77835bda54276fedef6c62f3dbdc1ee919  eget.sh" | shasum -a 256 -c -
    then bash eget.sh
    else echo "eget.sh SHA256 does not match"
fi
rm ./eget.sh

# nushell

sudo ./eget nushell/nushell --to=/usr/local/bin --asset="linux-musl" --file=nu

# starship

curl -sS -o install-starship.sh https://starship.rs/install.sh \
    && chmod +x ./install-starship.sh \
    && sudo ./install-starship.sh -y \
    && rm ./install-starship.sh

starship preset pure-preset -o ~/.config/starship.toml

mkdir -p ~/.cache/starship
starship init nu > ~/.cache/starship/init.nu

nu -e '"\nuse ~/.cache/starship/init.nu\n" | save --append $nu.config-path; exit'

# carapace

sudo ./eget carapace-sh/carapace-bin --to=/usr/local/bin --asset="tar.gz" --file=carapace

mkdir -p ~/.cache/carapace
carapace _carapace nushell > ~/.cache/carapace/init.nu

nu -e '"\nsource ~/.cache/carapace/init.nu\n" | save --append $nu.config-path; exit'

# exa ll alias

nu -e '"\nalias ll = exa -a -lbF --git\n" | save --append $nu.config-path; exit'
# nu -e '"\ndef ll [] { ls | sort-by type }\n" | save --append $nu.config-path; exit'

# .local/bin

mkdir -p ~/.local/bin

./eget ekzhang/bore --to=~/.local/bin
./eget abs-lang/abs --to=~/.local/bin
./eget Nukesor/pueue --to=~/.local/bin --asset="pueue-"
./eget Nukesor/pueue --to=~/.local/bin --asset="pueued-"
./eget upx/upx --to=~/.local/bin
./eget martinvonz/jj --to=~/.local/bin
./eget Wilfred/difftastic --to=~/.local/bin
./eget extrawurst/gitui --to=~/.local/bin
./eget wagoodman/dive --to=~/.local/bin
./eget yorukot/superfile --to=~/.local/bin
./eget sxyazi/yazi --to=~/.local/bin
./eget kdash-rs/kdash --to=~/.local/bin
./eget zyedidia/micro --to=~/.local/bin

curl -SL -O https://nojs.murex.rocks/bin/latest/murex-linux-amd64.gz \
    && gunzip murex-linux-amd64.gz \
    && chmod +x murex-linux-amd64 \
    && sudo mv murex-linux-amd64 /usr/local/bin/murex

curl -LO https://fossil-scm.org/home/uv/fossil-linux-x64-2.22.tar.gz \
    && tar -xaf fossil-linux-x64-2.22.tar.gz \
    && sudo mv fossil /usr/local/bin/

curl -LO https://dystroy.org/broot/download/x86_64-linux/broot \
    && chmod +x broot \
    && sudo mv broot /usr/local/bin/
