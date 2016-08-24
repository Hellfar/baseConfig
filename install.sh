#!/bin/bash

GROUP=".*"

if [ -n "$1" ]; then
  GROUP="$1"
fi

./.bin/iniLoader.sh "$GROUP/.*" install_list | while read line; do
  IFS=/ read group soft <<< `echo "$line"`
  case "$group" in
    "default")
      sudo apt-get install "$soft" -y
      ;;
    "npm")
      sudo npm -g install "$soft"
      ;;
  esac
done
