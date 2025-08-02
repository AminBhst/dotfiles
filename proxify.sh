#!/bin/bash

set -euo pipefail

DESKTOP_FILE=$(find /usr/share/applications -name '*.desktop' | fzf)

[ -z "$DESKTOP_FILE" ] && { echo "No selection made."; exit 1; }

echo "Modifying: $DESKTOP_FILE"

sudo cp "$DESKTOP_FILE" "$DESKTOP_FILE.bak"

tmpfile=$(mktemp)

in_entry=0
exec_done=0

while IFS= read -r line; do
  if [[ "$line" =~ ^\[Desktop\ Entry\] ]]; then
    in_entry=1
  elif [[ "$line" =~ ^\[.*\] ]]; then
    in_entry=0
  fi

  if [[ $in_entry -eq 1 && $exec_done -eq 0 && "$line" =~ ^Exec= ]]; then
    # Extract command after Exec=
    cmd="${line#Exec=}"
    # Escape single quotes inside cmd for sh -c
    escaped_cmd=$(printf %s "$cmd" | sed "s/'/'\\\\''/g")
    # Build new Exec line with proxy wrapper
    new_exec="Exec=sh -c 'http_proxy=socks5://127.0.0.1:10808 https_proxy=socks5://127.0.0.1:10808 $escaped_cmd'"
    echo "$new_exec" >> "$tmpfile"
    exec_done=1
  else
    echo "$line" >> "$tmpfile"
  fi
done < "$DESKTOP_FILE"

sudo mv "$tmpfile" "$DESKTOP_FILE"

echo "✔ Successfully proxified the desktop entry file"

