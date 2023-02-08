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
#
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'on %b'

# vim it all
set -o vi
source "$HOME/dotfiles/zsh-plugins/zsh-vim-mode.plugin.zsh"

# perfect prompt
source "$HOME/dotfiles/zsh-plugins/git-prompt.sh"
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
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
