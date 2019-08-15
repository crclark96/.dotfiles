#!/bin/bash
# adds current song/artist next to volume info

unbuffer i3status | while :
do
  read -r line
  brightness="$($HOME/.bin/brightness)"
  echo -e "💡: $brightness | $line" || exit 1
done
