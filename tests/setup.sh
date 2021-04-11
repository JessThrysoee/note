#!/bin/bash

export EDITOR=":"
export NOTE_BLANK="__________"
export NOTE_DIR=$(mktemp -d)

trap "rm -rf $NOTE_DIR" EXIT

i=0
assert() {
  if grep -q "$2" "$3"
  then
    echo "OK   : ${0##*/}.${1}"
  else
    echo "FAIL : ${0##*/}.${1}"
  fi
}


updateHeader() {
  local file="$1" previous="$2" cur="$3" next="$4"
  local pattern

  pattern="┃  ◀ $previous  ┃  $cur  ┃  $next ▶  ┃"
  if ! grep -q "^$pattern" "$file"
  then
    sed "1,\$s/^┃  ◀ .*$/$pattern/" "$file" > "${file}.new"
    mv -f -- "${file}.new" "$file"
  fi
}


