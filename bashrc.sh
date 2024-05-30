#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

## bashrc colorize

# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=200
HISTFILESIZE=400

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export TERM="xterm-256color"

# Reset
Color_Off='\e[0m' # Text Reset

# Regular Colors
Black='\e[0;30m'  # Black
Red='\e[0;31m'    # Red
Green='\e[0;32m'  # Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m'   # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m'   # Cyan
White='\e[0;37m'  # White

# Bold
BBlack='\e[1;30m'  # Black
BRed='\e[1;31m'    # Red
BGreen='\e[1;32m'  # Green
BYellow='\e[1;33m' # Yellow
BBlue='\e[1;34m'   # Blue
BPurple='\e[1;35m' # Purple
BCyan='\e[1;36m'   # Cyan
BWhite='\e[1;37m'  # White

# Underline
UBlack='\e[4;30m'  # Black
URed='\e[4;31m'    # Red
UGreen='\e[4;32m'  # Green
UYellow='\e[4;33m' # Yellow
UBlue='\e[4;34m'   # Blue
UPurple='\e[4;35m' # Purple
UCyan='\e[4;36m'   # Cyan
UWhite='\e[4;37m'  # White

# Background
On_Black='\e[40m'  # Black
On_Red='\e[41m'    # Red
On_Green='\e[42m'  # Green
On_Yellow='\e[43m' # Yellow
On_Blue='\e[44m'   # Blue
On_Purple='\e[45m' # Purple
On_Cyan='\e[46m'   # Cyan
On_White='\e[47m'  # White

# High Intensity
IBlack='\e[0;90m'  # Black
IRed='\e[0;91m'    # Red
IGreen='\e[0;92m'  # Green
IYellow='\e[0;93m' # Yellow
IBlue='\e[0;94m'   # Blue
IPurple='\e[0;95m' # Purple
ICyan='\e[0;96m'   # Cyan
IWhite='\e[0;97m'  # White

# Bold High Intensity
BIBlack='\e[1;90m'  # Black
BIRed='\e[1;91m'    # Red
BIGreen='\e[1;92m'  # Green
BIYellow='\e[1;93m' # Yellow
BIBlue='\e[1;94m'   # Blue
BIPurple='\e[1;95m' # Purple
BICyan='\e[1;96m'   # Cyan
BIWhite='\e[1;97m'  # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'  # Black
On_IRed='\e[0;101m'    # Red
On_IGreen='\e[0;102m'  # Green
On_IYellow='\e[0;103m' # Yellow
On_IBlue='\e[0;104m'   # Blue
On_IPurple='\e[0;105m' # Purple
On_ICyan='\e[0;106m'   # Cyan
On_IWhite='\e[0;107m'  # White

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

#HOST_COLOR=${UGreen}

FQDN=$(hostname -f)
function __makeTerminalTitle() {
    local title=''

    local CURRENT_DIR="${PWD/#$HOME/\~}"

    if [ -n "${SSH_CONNECTION}" ]; then
        title+="$(hostname):${CURRENT_DIR} [$(whoami)@${FQDN}]"
    else
        title+="${CURRENT_DIR} [$(whoami)]"
    fi

    echo -en '\033]2;'${title}'\007'
}

function __getMachineId() {
    if [ -f /etc/machine-id ]; then
        echo $((0x$(cat /etc/machine-id | head -c 15)))
    else
        echo $(((${#HOSTNAME} + 0x$(hostid))))
    fi
}

function __makePS1() {
    local EXIT="$?"

    if [ ! -n "${HOST_COLOR}" ]; then
        local H=$(__getMachineId)
        HOST_COLOR=$(tput setaf $((H % 5 + 2))) # foreground
        #HOST_COLOR="\e[4$((H%5 + 2))m" # background
    fi

    PS1=''

    PS1+="${debian_chroot:+($debian_chroot)}"

    if [ -n "${VIRTUAL_ENV}" ]; then
        local VENV=$(basename $VIRTUAL_ENV)
        PS1+="\[${BWhite}\](${VENV}) \[${Color_Off}\]" # show virtualenv if in it
    fi

    if [ ${USER} == root ]; then
        PS1+="\[${Red}\]" # root
    elif [ ${USER} != ${LOGNAME} ]; then
        PS1+="\[${Blue}\]" # normal user
    else
        PS1+="\[${Green}\]" # normal user
    fi
    PS1+="\u\[${Color_Off}\]"

    if [ -n "${SSH_CONNECTION}" ]; then
        PS1+="\[${BWhite}\]@"
        PS1+="\[${UWhite}${HOST_COLOR}\]\h\[${Color_Off}\]" # host displayed only if ssh connection
    fi

    PS1+=":\[${BYellow}\]\w" # working directory

    # background jobs
    local NO_JOBS=$(jobs -p | wc -w)
    if [ ${NO_JOBS} != 0 ]; then
        PS1+=" \[${BGreen}\][j${NO_JOBS}]\[${Color_Off}\]"
    fi

    # screen sessions
    local SCREEN_PATHS="/var/run/screens/S-$(whoami) /var/run/screen/S-$(whoami) /var/run/uscreens/S-$(whoami)"

    for screen_path in ${SCREEN_PATHS}; do
        if [ -d ${screen_path} ]; then
            SCREEN_JOBS=$(ls ${screen_path} | wc -w)
            if [ ${SCREEN_JOBS} != 0 ]; then
                local current_screen="$(echo ${STY} | cut -d '.' -f 1)"
                if [ -n "${current_screen}" ]; then
                    current_screen=":${current_screen}"
                fi
                PS1+=" \[${BGreen}\][s${SCREEN_JOBS}${current_screen}]\[${Color_Off}\]"
            fi
            break
        fi
    done

    # git branch
    if [ -x "$(which git 2>&1)" ]; then
        local branch="$(git name-rev --name-only HEAD 2>/dev/null)"

        if [ -n "${branch}" ]; then
            local git_status="$(git status --porcelain -b 2>/dev/null)"
            local letters="$(echo "${git_status}" | grep --regexp=' \w ' | sed -e 's/^\s\?\(\w\)\s.*$/\1/')"
            local untracked="$(echo "${git_status}" | grep -F '?? ' | sed -e 's/^\?\(\?\)\s.*$/\1/')"
            local status_line="$(echo -e "${letters}\n${untracked}" | sort | uniq | tr -d '[:space:]')"
            PS1+=" \[${BBlue}\](${branch}"
            if [ -n "${status_line}" ]; then
                PS1+=" ${status_line}"
            fi
            PS1+=")\[${Color_Off}\]"
        fi
    fi

    # exit code
    if [ ${EXIT} != 0 ]; then
        PS1+=" \[${BRed}\][!${EXIT}]\[${Color_Off}\]"
    fi

    PS1+=" \[${BPurple}\]\\$\[${Color_Off}\] " # prompt

    __makeTerminalTitle
}

if [ "$color_prompt" = yes ]; then
    PROMPT_COMMAND=__makePS1
    PS2="\[${BPurple}\]>\[${Color_Off}\] " # continuation prompt
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

umask 022

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi