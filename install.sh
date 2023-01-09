cp .zshrc $HOME/.zshrc
cp .gitignore $HOME/.gitignore
sed "s:HOME_DIR:$HOME:g" .gitconfig > $HOME/.gitconfig

curl -L -o file.deb https://github.com/dandavison/delta/releases/download/0.15.1/git-delta-musl_0.15.1_amd64.deb \
    && sudo dpkg -i file.deb && rm file.deb
