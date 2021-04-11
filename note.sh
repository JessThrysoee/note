#!/bin/bash

: "${NOTE_DIR:=$HOME/.note}"

if [[ ! -d $NOTE_DIR ]]
then
  echo "Directory does not exist: $NOTE_DIR"
  exit 1
fi

[[ $1 == --reindex ]] && REINDEX="true" || REINDEX="false"


##---

TODAY="${NOTE_TODAY:-$(date +%F)}"
TODAY_FILE="$NOTE_DIR/$TODAY"

BLANK="${NOTE_BLANK:-          }"


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


reindex() {
  local paths baseNames len i file cur 

  paths=("$NOTE_DIR"/*)
  baseNames=("${paths[@]##*/}")

  len="${#baseNames[@]}"

  for i in "${!baseNames[@]}"
  do
    file="$NOTE_DIR/${baseNames[$i]}"

    cur="${baseNames[$((i))]}"
    (( i == 0 ))       && previous="$BLANK" || previous="${baseNames[$((i-1))]}"
    (( i == len - 1 )) &&     next="$BLANK" ||     next="${baseNames[$((i+1))]}"

    updateHeader "$file" "$previous" "$cur" "$next"
  done
}


today() {
  local paths baseNames len previous cur next previousFile 

  paths=("$NOTE_DIR"/*)
  baseNames=("${paths[@]##*/}")

  len="${#baseNames[@]}"

  (( len == 0 )) && previous="$BLANK" || previous="${baseNames[$((len-1))]}"

  cat > "$TODAY_FILE" <<EOF 
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┓
┃  ◀ ${previous}  ┃  $TODAY  ┃  $BLANK ▶  ┃
┗━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━┛
EOF

  if (( len > 0 ))
  then
    # fixup header in previous note
    previousFile="$NOTE_DIR/$previous" 
    cur="$previous"
    (( len == 1 )) && previous="$BLANK" || previous="${baseNames[$((len-2))]}"
    next="$TODAY"
    updateHeader "$previousFile" "$previous" "$cur" "$next"
  fi
}


shopt -s nullglob

if [[ $REINDEX == true ]]
then
    reindex
else
  [[ ! -f $TODAY_FILE ]] && today
  ${EDITOR:-vim} "$TODAY_FILE"
fi


