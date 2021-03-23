# ls colors
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagacad
export LS_COLORS='di=36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# Set prompt
if [ $(echo $0) = "bash" ]; then
  PS1="\e[0;94m\u\e[0m@\h \e[1m\w\e[0m % "
fi

