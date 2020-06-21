parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[1;38;5;93m\]\u@\h\[\033[00m\]:\[\033[1;38;5;190m\]\w\[\033[0;38;5;40m\]\$(parse_git_branch)\[\033[00m\]$ "

