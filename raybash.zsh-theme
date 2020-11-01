function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo "%%"; fi
}

PROMPT='%B%(?.%F{69}.%F{196})%n@%M%f%b:%B%F{191}%~%b%F{85}$(git_prompt_info)%f$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
