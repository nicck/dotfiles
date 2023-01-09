cp .zshrc $HOME/.zshrc
cp .gitignore $HOME/.gitignore
sed "s:HOME_DIR:$HOME:g" .gitconfig > $HOME/.gitconfig

curl -L https://github.com/dandavison/delta/releases/download/0.15.1/git-delta_0.15.1_amd64.deb -o git-delta_0.15.1_amd64.deb
sudo dpkg -i git-delta_0.15.1_amd64.deb
rm git-delta_0.15.1_amd64.deb
