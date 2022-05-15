[ -d "/usr/local/sbin" ] && export PATH="/usr/local/sbin:$PATH"
[ -d "/usr/local/bin" ] && export PATH="/usr/local/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH";

[ -f .alias ] && source .alias

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ls colors
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagacad
export LS_COLORS='di=36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# Homebrew settings
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS="--require-sha --appdir=~/Applications"

# Set prompt
if [ $(echo $0) = "bash" ]; then
  PS1="\e[0;94m\u\e[0m@\h \e[1m\w\e[0m % "
fi

# Git user configuration
git config --global user.email "{$EMAIL:-viktoras.bezaras@gmail.com}"
git config --global user.signingkey "{$GPG_KEY:-7DFF92A387918961)"
