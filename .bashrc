# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
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
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]\[\033[01;37m\]@\[\033[00m\]\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS2='\[\033[01;33m\]'`echo $(hostname)|sed 's/././g'`':\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS2="`echo $(hostname)|sed 's/././g'`: "
fi

function prompt_command {
    if [ "$color_prompt" = yes ]; then
        local color_error="$(/usr/bin/tput setab 1)$(/usr/bin/tput setaf 7)"
        local color_error_off="$(/usr/bin/tput sgr0)"
    fi

    # get cursor position and add new line if we're not in first column
    echo -en "\033[6n" && read -sdR CURPOS
    [[ ${CURPOS##*;} -gt 1 ]] && echo "${color_error}↵${color_error_off}"
}

PROMPT_COMMAND=prompt_command

#unset color_prompt force_color_prompt

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias ls="ls --color=auto"

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

export HACKPAGER=less
export PAGER=less

export PAGER=less
export LESS="-r"

# Раскраска man-страниц.
# man 5 termcap
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[1;33m'  
export LESS_TERMCAP_me=$'\E[0m' # 22;39m'
export LESS_TERMCAP_so=$'\E[44m\E[1;33m'
export LESS_TERMCAP_se=$'\E[0m' # 49;39m'
export LESS_TERMCAP_us=$'\E[4;33m'
export LESS_TERMCAP_ue=$'\E[0m' # 24;39m'

export MPD_HOST=127.0.0.1

export LS_OPTIONS="--color=always"
export GREP_OPTIONS="--color"

export http_proxy="http://bp3:bp3@main.edc.local:8080"

export GDBHISTFILE=~/.gdb_history

export PATH=~/altera/12.1/modelsim_ase/bin:~/altera/12.1/quartus/bin:${PATH}

#. ~/localroot/set_env

