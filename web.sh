#!/bin/sh

_getquery() {
  # URL encode
  args="$@"
  modded_query=$(printf '%s' "$args" | xxd -p | sed 's/../%&/g')
  printf '%s' "$modded_query"
}

web() {
  query=$(_getquery "$@")
  url="https://lite.duckduckgo.com/lite/?q=$query"
  w3m "$url"
}

wiki() {
  query=$(_getquery "$@")
  url="https://en.wikipedia.org/wiki/$query"
  w3m "$url"
}
