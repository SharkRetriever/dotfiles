#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

dotfiles_dir="$HOME/Documents/mydocs/coding/dotfiles"
source "$dotfiles_dir/ps1.sh"
source "$dotfiles_dir/ls-colors.sh"
source "$dotfiles_dir/music.sh"
source "$dotfiles_dir/web.sh"
source "$dotfiles_dir/.bash_aliases"
