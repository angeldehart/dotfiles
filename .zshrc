#     "ZSHRC"
# BY ANGEL CAMPBELL
#     A NOVEL


# America's favorite paths time
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
[ -f ~/.cargo/env ] && source ~/.cargo/env
export FZF_BASE="/opt/homebrew/opt/fzf/"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="minimal"
plugins=(git aws direnv fzf npm brew kubectl 1password)
source $ZSH/oh-my-zsh.sh

# vim it all
set -o vi

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

# Compilation flags for M1 stuff
# export ARCHFLAGS="-arch x86_64"

# aliases
[ -f ~/dotfiles/.bash_aliases ] && source ~/dotfiles/.bash_aliases

# Local (nonmanaged) zsh config ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# # Vim iced clojure support
# PATH=~/.config/nvim/plugged/vim-iced/bin:${PATH}
