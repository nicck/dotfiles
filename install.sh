cp -f .zshrc $HOME/.zshrc
cp -f .gitignore $HOME/.gitignore
sed "s:HOME_DIR:$HOME:g" .gitconfig > $HOME/.gitconfig

curl -L -o file.deb https://github.com/dandavison/delta/releases/download/0.15.1/git-delta-musl_0.15.1_amd64.deb \
    && sudo dpkg -i file.deb && rm file.deb

curl -SL -o nu-shell.tar.gz https://github.com/nushell/nushell/releases/download/0.85.0/nu-0.85.0-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xf nu-shell.tar.gz && rm nu-shell.tar.gz && sudo cp nu-shell/nu /usr/local/bin/
