cp -f .zshrc $HOME/.zshrc
cp -f .gitignore $HOME/.gitignore
sed "s:HOME_DIR:$HOME:g" .gitconfig > $HOME/.gitconfig
mkdir -p ~/.local/bin

# eget

curl -o eget.sh https://zyedidia.github.io/eget.sh
if echo "0e64b8a3c13f531da005096cc364ac77835bda54276fedef6c62f3dbdc1ee919  eget.sh" | shasum -a 256 -c -
    then bash eget.sh
    else echo "eget.sh SHA256 does not match"
fi
rm ./eget.sh
mv ./eget ~/.local/bin/eget

~/.local/bin/eget dandavison/delta --to ~/.local/bin
