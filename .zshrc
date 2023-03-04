#     "ZSHRC"
# BY ANGEL CAMPBELL
#     A NOVEL


# America's favorite paths time
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
[ -f ~/.cargo/env ] && source ~/.cargo/env
export FZF_DEFAULT_COMMAND="rg --files --hidden"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pure prompt (brew install pure)
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -Uz promptinit
promptinit
prompt pure

# vim it all
set -o vi
source "$HOME/dotfiles/zsh-plugins/zsh-vim-mode.plugin.zsh"


# Brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# aliases
[ -f ~/dotfiles/.bash_aliases ] && source ~/dotfiles/.bash_aliases

# Local (nonmanaged) zsh config ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

