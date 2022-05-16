[[ -s ~/.bash_profile ]] && source ~/.bash_profile

export ZSH="$HOME/.oh-my-zsh"

export DISABLE_AUTO_UPDATE="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

ZSH_THEME_GIT_PROMPT_PREFIX=" ["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$FG[012]%}%n%{$reset_color%}@%m %(!.%{$fg[red]%}.%{$fg_bold[white]%})%~%{$reset_color%}%{$fg[green]%}$(git_prompt_info)%{$reset_color%} %% '
RPROMPT='%(?..%{$fg_bold[red]%}Return code: %?%{$reset_color%})'

