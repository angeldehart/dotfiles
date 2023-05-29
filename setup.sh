#!/bin/bash
echo "Installing a bunch of stuff go for a walk"

echo "Install homebrew"
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Brew installs"
brew upgrade
brew install git gh fzf rg fd kitty asdf neovim pure

echo asdf
for LANG in nodejs python erlang elixir 
do
  asdf plugin add $LANG
  asdf install $LANG latest
  asdf global $LANG latest
done

echo Dotfiles
cd ~
gh repo clone angeldehart/dotfiles
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
ln -sF ~/dotfiles/.zshrc ~/.zshrc
ln -sF ~/dotfiles/kitty.conf ~/.config
ln -sF ~/dotfiles/init.lua ~/.config/nvim/init.lua
git config --global core.excludesfile ~/dotfiles/.gitignore_global
exec $SHELL

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable

npm i -g neovim
pip install --user pynvim
exec $SHELL
