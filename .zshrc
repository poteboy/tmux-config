
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="./node_modules/.bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=~/.local/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"; fi
export PATH="/usr/local/sbin:$PATH"
export PGDATA=/usr/local/var/postgres
export PATH="$HOME/.rbenv/bin:$PATH"
function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}
eval "$(rbenv init - zsh)"
# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='%n@%m %c'\$vcs_info_msg_0_' %# '
precmd(){ vcs_info }

function peco-cd {
  cd "$( ghq list --full-path | peco)"
}

gcp() {
  git branch -a --sort=-authordate |
    grep -v -e '->' -e '*' |
    perl -pe 's/^\h+//g' |
    perl -pe 's#^remotes/origin/###' |
    perl -nle 'print if !$c{$_}++' |
    peco |
    xargs git checkout
}

alias pc='peco-cd'

setopt +o nomatch
alias cdd='cd desktop'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias cdm='cd; cd desktop/micin'
alias cdc='cd; cd desktop/schools/capstone'
alias dcb='docker-compose exec spring bash'
alias ide='~/.tmux/ide.sh'
alias dc='docker-compose'
alias ys='yarn start'
alias da='docker attach $(docker-compose ps -q server)'
alias t='tmux'
alias cdmc='cd; cd desktop/micin/curon-api-server'
alias cdml='cdm; cd latour'
alias tk='tmux kill-session'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin'
alias ts='cd; tmux source ~/.tmux.conf; cp -pr .tmux.conf ~/.tmux'
alias zs='cd; source ~/.zshrc; cp -pr ~/.zshrc ~/.tmux'
alias spec='docker-compose exec spring spring rspec'
alias py='python'
alias e='exit'
