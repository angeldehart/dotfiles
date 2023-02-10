#     "ZSHRC"
# BY ANGEL CAMPBELL
#     A NOVEL


# America's favorite paths time
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
[ -f ~/.cargo/env ] && source ~/.cargo/env
export FZF_BASE="/opt/homebrew/opt/fzf/"
export FZF_DEFAULT_COMMAND="rg --files --hidden"

# vim it all
set -o vi
source "$HOME/dotfiles/zsh-plugins/zsh-vim-mode.plugin.zsh"

# perfect prompt
source "$HOME/dotfiles/zsh-plugins/git-prompt.sh"
setopt PROMPT_SUBST
export PROMPT="%F{magenta}%n%f@%.: "
export RPROMPT="${MODE_INDICATOR_PROMPT}$(__git_ps1 "%s")"

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
export PATH="/opt/homebrew/sbin:$PATH"
