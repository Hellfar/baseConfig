#!/bin/bash

GROUP=".*"

if [ -n "$1" ]; then
  GROUP="$1"
fi

./.bin/iniLoader.sh "$GROUP/.*" install_list | while read line; do
  IFS=/ read group soft <<< `echo "$line"`
  script="`ls install_script/ | grep -P \"^$soft(\.sh)?$\"`"
  if [ -n "$script" ]; then
    echo "$script" | while read line2; do
      ./install_script/$line2 "$group" "$soft"
    done
  else
    case "$group" in
      "default")
        sudo apt-get install "$soft" -y
        ;;
      "npm")
        sudo npm -g install "$soft"
        ;;
    esac
  fi
done

# rm -rf install.sh install_script
