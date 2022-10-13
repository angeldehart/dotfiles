#!/bin/bash
echo "Installing a bunch of stuff go for a walk"
# note: brew and git must be installed already 🤷

# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Dotfiles
cd ~
mkdir -p ~/.config/kitty
git clone https://github.com/angeldehart/dotfiles.git
ln -sF ~/dotfiles/.zshrc ~/.zshrc
ln -sF ~/dotfiles/kitty.conf ~/.config
git config --global core.excludesfile ~/dotfiles/.gitignore_global
source ~/.zshrc

# Brew installs
brew upgrade
brew install --HEAD neovim
brew install fzf kitty rg fd elixir erlang nodejs python gh
brew install --cask dropbox dash neovide spotify
brew install --cask 1password/tap/1password-cli

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable

exec $SHELL
npm i -g neovim
pip install --user pynvim
exec $SHELL

# Lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -sF ~/dotfiles/config.lua ~/.config/lvim/config.lua	

