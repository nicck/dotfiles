# nushell

sudo ./eget nushell/nushell --to=/usr/local/bin --asset="linux-musl" --file=nu

./eget cli/cli --to ~/.local/bin --asset="tar.gz"
./eget ekzhang/bore --to=~/.local/bin
./eget abs-lang/abs --to=~/.local/bin
./eget Nukesor/pueue --to=~/.local/bin --asset="pueue-"
./eget Nukesor/pueue --to=~/.local/bin --asset="pueued-"
./eget upx/upx --to=~/.local/bin
./eget martinvonz/jj --to=~/.local/bin
./eget Wilfred/difftastic --to=~/.local/bin
./eget extrawurst/gitui --to=~/.local/bin
./eget wagoodman/dive --to=~/.local/bin
./eget tokuhirom/dcv --to=~/.local/bin
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
