# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jonathan"

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gcb="git checkout -b"
alias gc="git checkout"
alias gcom="git checkout main"
alias gb="git branch"
alias ga="git add"
alias gp="git push"
alias gi="git init"
alias gpom="git push origin main"
alias gbd="git branch -D "
alias pull="git pull"

# Navigation aliases
alias cdt="cd ~/Turing"

# Other aliases
alias vimrc="vim ~/.vimrc"
alias aliases="vim ~/.bash_profile"
alias spell="aspell -c"
alias cov="open coverage/index.html"
alias weather="curl -s wttr.in/denver"

# Rails aliases
alias yolo="bundle exec rails db:drop db:create db:migrate db:seed"
alias bers='bundle exec rspec'

# Heroku Aliases
alias hc="heroku create"
alias hp="git push heroku main"
alias ho="heroku open"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init - zsh)"
