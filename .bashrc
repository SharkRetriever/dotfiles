#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

source "ps1.sh"
source "ls-colors.sh"
source "music.sh"
source "web.sh"
source ".bash_aliases"
