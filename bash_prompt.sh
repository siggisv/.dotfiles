# Adding git-prompt ############
. ~/.git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto verbose git"

# Color settings for showing python virtualenv:
Venv_color="\[\033[0;32;2;4;7m\]"
Color_Off="\[\033[0m\]"

TMP_PS1=${PS1%\\$ }

PROMPT_COMMAND='__git_ps1 "${TMP_PS1}\n${VIRTUAL_ENV:+$Venv_color|`basename $VIRTUAL_ENV`|$Color_Off }" "\$ " "⎇ %s ]"'
