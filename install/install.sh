#!/bin/bash

GROUP=".*"

if [ -n "$1" ]; then
  GROUP="$1"
fi

# Package installation
./.bin/iniLoader.sh "^$GROUP/.*" install_list | while read line; do
  IFS=/ read group soft <<< `echo "$line"`
  script="`ls install_scripts/ | grep -P \"^$soft(\.sh)?$\"`"
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
      "gem")
        gem install "$soft"
        ;;
    esac
  fi
done

# configuration deployment
./.bin/iniLoader.sh "^$GROUP/.*" deployment_list | while read line; do
  IFS=/ read group pattern <<< `echo "$line"`
  script="`ls implement_scripts/ | grep -P \"^$pattern(\.sh)?$\"`"
  if [ -n "$script" ]; then
    echo "$script" | while read line2; do
      ./implement_scripts/$line2 "$group" "$pattern"
    done
  else
    IFS=: read origin dest <<< `echo "$pattern"`
    case "$group" in
      "default")
        cp "$origin" "$dest"
        ;;
      "sudo")
        sudo cp "$origin" "$dest"
        ;;
    esac
  fi
done

# rm -rf install.sh install_script
