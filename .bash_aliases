# get back up the tree faster
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias .....=' cd ../../../..'
alias ......=' cd ../../../../..'
# git stuff
alias gs='git status'
alias gl='git log --oneline --graph --decorate $argv'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grs='git rebase source/master'
alias grsd='git rebase source/development'
alias ga='git add -p'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gco='git checkout -b $argv'
alias gcod='git checkout development'
alias gcom='git checkout master'
alias gf='git fetch --all --prune'
alias gpf='git push --force-with-lease'
alias gpr='hub pull-request -h master -b NavitasLease:master'
alias gprd='hub pull-request -h master -b NavitasLease:development'
alias gps='git pull source master'
# git submodule stuff
alias gsuu='git submodule update --remote --rebase'
alias gsup='git push --recurse-submodules=on-demand'
# no time to type "nvim"
alias nv="nvim"
# serve current directory
alias srvdir="live-server"
# easier xclipping
alias xclip="xclip -selection c"
# clear the screen
alias cl=clear
# list everything
alias la='ls -la'
# git grep
alias gag="git --no-pager grep --heading --break --line-number"
# give me my ip
alias haz="curl -4 icanhazip.com"
# copy local ip
alias myip="ifconfig | grep en0 -A 3 | grep \"inet \" | cut -d \" \" -f 2"
# docker compose
alias dc="docker-compose"
# react native
alias rn="react-native"
# clojure cider
alias cider="clj -Sdeps '{:deps {cider/cider-nrepl {:mvn/version \"0.18.0\"} }}' -e '(require (quote cider-nrepl.main)) (cider-nrepl.main/init [\"cider.nrepl/cider-middleware\"])'"
# clojure piggieback
alias piggieback="clj -R:nrepl -m nrepl.cmdline --middleware \"[cider.piggieback/wrap-cljs-repl]\""
# newsbeueter
alias nb="newsboat"
# tmux in color mode with unicode
alias tmux="tmux -u2"
# arduino CLI tool
alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
# do work
alias dw="cd ~/dev/work"
# mix testing
alias mixtest="mix test --stale --listen-on-stdin"
# open phoenix server
alias imps="iex -S mix phx.server"
# killall zsh
alias killzsh="ps ax -o pid,command,ppid | grep 'zsh' | awk '{print $1}' | xargs kill -9"
# Open localhost
olh () {
    open http://localhost:$1;
}
