# Adding git-prompt ############
. ~/.git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
Color_Off="\[\033[0m\]"
Und_Off="\[\033[24m\]"
Inv_Off="\[\033[27m\]"
Yellow="\[\033[0;33m\]"
Venv_color="\[\033[0;32;2;4;7m\]"
TMP_PS1=${PS1%\\$ }
#TMP_PS1=${PS1}


# SEGMENT_SEPARATOR=''
# RIGHT_SEPARATOR=''
# LEFT_SUBSEG=''
# RIGHT_SUBSEG=''

PROMPT_COMMAND='__git_ps1 "${TMP_PS1}\n${VIRTUAL_ENV:+$Venv_color|`basename $VIRTUAL_ENV`|$Color_Off }" "\$ " "⎇  %s ]"'
# PROMPT_COMMAND='__git_ps1 "${VIRTUAL_ENV:+(`basename $VIRTUAL_ENV`) }${TMP_PS1}" "\$ "'


