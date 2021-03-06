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
    xterm-color|*-256color) color_prompt=yes;;
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# Tell tmux to use true colors
export TERM=xterm-256color

# Prevent Ctrl-S from stopping the terminal
stty -ixon

# alias for managing dotfiles with git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ROS
# source /opt/ros/melodic/setup.bash

# ROS autonomy repo commands

# echo MIT Driverless testbed IP: 192.168.0.230
# alias xcd="cd /home/$USER/autonomy"
# alias xs="source /home/$USER/autonomy/devel/setup.bash"
# alias xmaster="export ROS_IP=192.168.1.2; export ROS_MASTER_URI=http://luke:11311;"
# alias xunmaster="unset ROS_IP; unset ROS_MASTER_URI"
# alias eluke=" ssh luke@luke -X"
# alias xp="rosservice call /perception_server/reset"

# DRL knightrider repo commands
# alias rcd="cd /home/$USER/knightrider/catkin_ws"
# alias rs="source /home/$USER/knightrider/catkin_ws/src/knightrider-mobility/launch/tools/environment_setup.sh"

# xs

# auto activate virtual environments
# if [ -n "$VIRTUAL_ENV" ]; then
#    source $VIRTUAL_ENV/bin/activate;
# fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# # compile pyenv pythons with linking support for YouCompleteMe
# export PYTHON_CFLAGS="-fPIC"
# export PYTHON_CONFIGURE_OPTS="--enable-shared --enable-unicode=ucs4"
# export LD_LIBRARY_PATH=/home/$USER/.pyenv/versions/3.8.0/lib:$LD_LIBRARY_PATH

# ROS YouCompleteMe
# export ROS_WORKSPACE=/home/$USER/autonomy/src
