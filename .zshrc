# Paths
export PATH=$HOME/bin:/usr/local/bin:$PATH

## Python
export PATH=$HOME/Library/Python/2.7/bin:$PATH

## Fastlane
export PATH=$HOME/.fastlane/bin:$PATH

## Gradle
export GRADLE_HOME=/usr/local/opt/gradle/libexec
export PATH=$GRADLE_HOME/bin:$PATH

## Java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:/opt/gradle/gradle-4.4.1/bin

## Flutter
export FLUTTER_HOME="$HOME/flutter"
export PATH="$FLUTTER_HOME/bin:$PATH"

## rbenv
export PATH=/usr/local/rbenv/bin:$PATH

# Alias
alias lastweek='git log --pretty=format:"%an | %ad | %s" --graph --relative-date | grep "Jon" | tail -r' #Get changes from user made since inception
alias mybr="git branch --sort=-committerdate | grep -e 'lazar/' | grep -ne '.*'"
function cbr() { mybr | head -n ${1:-1} | tail -n 1 | cut -f 2- -d ' ' | xargs -I{} git checkout {} } 
alias kill-retail="psql -c 'select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where pg_stat_activity.datname = '\''retail_development'\'' and pid <> pg_backend_pid()'"
alias kill-tt="psql -c 'select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where pg_stat_activity.datname = '\''test_track_development'\'' and pid <> pg_backend_pid()'"
alias rubocop-all="git diff master --name-only | sed 's/retail\///' | grep -v 'config/routes.rb' | xargs -I{} rubocop --auto-correct {}"

# Xcode
openx(){ 
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return  
    else
      echo "Nothing found"
    fi
  fi
}

# Go to the root of the current git project, or just go one folder up
function up() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# Powerline
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# zshell
ZSH_THEME=""
export ZSH="/Users/jonlazar/.oh-my-zsh"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Init rbenv
eval "$(rbenv init -)"

# Work
source "$HOME/.bootstrap/env.sh"
