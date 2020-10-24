function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo "%%"; fi
}

PROMPT='%B%(?.%F{63}.%F{red})%n@%M%f%b:%B%F{190}%~%b%F{86}$(git_prompt_info)%f$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
