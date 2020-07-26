eval "$(rbenv init -)"

set -o vi
# gives you vi editing at commandline

# enables 'git hub'
# eval "$(hub alias -s)"


# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
  cd "$(dirname $(gem which $1))"
}

export NVM_DIR="/Users/mdao/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gcb="git checkout -b"
alias gc="git checkout"
alias gcom="git checkout master"
alias gb="git branch"
alias ga="git add"
alias gh="git hist"
alias gp="git push"
alias gcm="git commit -m "
alias gi="git init"
alias gpom="git push origin master"
alias gbd="git branch -D "
alias pull="git pull"

# Navigation  aliases
alias cdt="cd ~/Turing"
alias cdd="cd ~/Desktop"
alias cdp="cd ~/Turing/projects"
alias cd1="cd ~/Turing/1module"
alias cd2="cd ~/Turing/2module"
alias cd3="cd ~/Turing/3module"
alias cd4="cd ~/Turing/4module"
alias teach="cd ~/teaching"
alias today="cd ~/teaching/today/source/outlines"
alias roster="cd ~/teaching/roster/data"

# Other aliases
alias vimrc="vim ~/.vimrc"
alias aliases="vim ~/.bash_profile"
alias spell="aspell -c"
alias cov="open coverage/index.html"
alias weather="curl -s wttr.in/denver"

# Rails aliases
alias yolo="bundle exec rake db:drop db:create db:migrate db:seed"
alias bert="bundle exec rake test"

# Heroku Aliases
alias hc="heroku create"
alias hp="git push heroku main"
alias ho="heroku open"

# Tmux aliases
alias tn="tmux new -s"
alias tl="tmux ls"
alias tc="tmux a -t "
alias tmuxc="vim ~/.tmux.conf"

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
# -a print all hidden items
alias l="ls -laFGgohq"

# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
  ruby -e '
    $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
    ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
  ' "$@"
}

# Enable git's tab-completion library
source /usr/local/etc/bash_completion.d/git-completion.bash

# Shortcut for bundle exec
alias be="bundle exec"

# Emacs
em () {
    open -a /usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs $*
  }

# Prompt
  function parse_git_branch {
    branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ "HEAD" = "$branch" ]; then
      echo "(no branch)"
    else
      echo "$branch"
    fi
  }

  function prompt_segment {
    # for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
    # change the 37 to change the foreground
    # change the 45 to change the background
    if [[ ! -z "$1" ]]; then
      echo "\[\033[${2:-37};45m\]${1}\[\033[0m\]"
    fi
  }

  function build_mah_prompt {
    # time
    ps1="$(prompt_segment " \@ ")"

    # cwd
    ps1="${ps1} $(prompt_segment " \w ")"

    # git branch
    git_branch=`parse_git_branch`
    if [[ ! -z "$git_branch" ]]
    then
      ps1="${ps1} $(prompt_segment " $git_branch " 32)"
    fi

    # next line
    ps1="${ps1}\n\$ "

    # set prompt output
    PS1="[\w ] [$git_branch] 🌀  "
  }

  PROMPT_COMMAND='build_mah_prompt'

export BASH_SILENCE_DEPRECATION_WARNING=1
