#!/bin/sh

MUS_DIR="~/Music"

_get_music_file() {
  query="$@"
  found_file=
  found_files=$(find "$MUS_DIR" -iname "*${query}*" -type f)
  # Out of these files, look for the one containing the query at the end
  i=0
  num_found_files=$(printf '%s\n' "$found_files" | wc -l)
  while [ $i -lt $num_found_files ]
  do
    # get the ith file and see if the query is at the end
    potential_file=$(printf '%s' "$found_files" | head -n $((i + 1)) | tail -n 1)
    last_segment=$(printf '%s' "$potential_file" | grep -Eio '[^/-]+$')
    last_segment_match=$(printf '%s' "$last_segment" | grep -io "$query")
    if [ -n "$last_segment_match" ]
    then
      found_file="$potential_file"
      break
    fi 
    i=$((i + 1))
  done
  printf '%s' "$found_file"
}

# List potential files to choose from
# This makes up for the other commands
# just picking the first thing and playing it
_list_searched_songs() {
  query="$@"
  found_files=$(find "$MUS_DIR" -iname "*${query}*" -type f)
  # Actually, just list all of these
  printf '%s\n' "$found_files"
}

# Plays ONE searched file using sox without confirmation
_play_searched_song_without_confirm() {
  query="$@"
  found_file=$(_get_music_file "$query")
  if [ -z "$found_file" ]
  then
    return 1
  fi
  play "$found_file" 2>/dev/null
}

# Same as above but with confirmation
_play_searched_song_with_confirm() {
  query="$@"
  found_file=$(_get_music_file "$query")
  if [ -z "$found_file" ]
  then
    return 1
  fi
  printf 'Play %s? (y/n)\n' "$found_file"
  read response
  if [ "$response" = 'y' ]
  then
    play "$found_file" 2>/dev/null
  fi
}

# Plays ONE searched file using sox without confirmation, but on loop
_loop_searched_song_without_confirm() {
  query="$@"
  found_file=$(_get_music_file "$query")
  if [ -z "$found_file" ]
  then
    return 1
  fi
  play "$found_file" repeat - 2>/dev/null
}

# Same as above but with confirmation
_loop_searched_song_with_confirm() {
  query="$@"
  found_file=$(_get_music_file "$query")
  if [ -z "$found_file" ]
  then
    return 1
  fi
  printf 'Play %s? (y/n)\n' "$found_file"
  read response
  if [ "$response" = 'y' ]
  then
    play "$found_file" repeat - 2>/dev/null
  fi
}

alias mu='_play_searched_song_without_confirm'
alias muc='_play_searched_song_with_confirm'
alias lu='_loop_searched_song_without_confirm'
alias luc='_loop_searched_song_with_confirm'
alias lsu='_list_searched_songs'
