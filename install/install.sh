#!/bin/bash

ROOTINSTALLDIR="install"

GROUP=".*"

if [ -n "$1" ]; then
  GROUP="$1"
fi

# Package installation
./.bin/iniLoader.sh "^$GROUP/.*" "$ROOTINSTALLDIR/install_list" | while read line; do
  IFS=/ read group soft <<< `echo "$line"`
  script="`ls $ROOTINSTALLDIR/install_scripts/ | grep -P \"^$soft(\.sh)?$\"`"
  if [ -n "$script" ]; then
    echo "$script" | while read line2; do
      ./$ROOTINSTALLDIR/install_scripts/$line2 "$group" "$soft"
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
      "apm")
        apm install "$soft"
        ;;
    esac
  fi
done

sudo apt-get -f install
sudo apt autoremove

# configuration deployment
./.bin/iniLoader.sh "^$GROUP/.*" "$ROOTINSTALLDIR/install_deployment/deployment_list" | while read line; do
  IFS=/ read group pattern <<< `echo "$line"`
  IFS=: read elem dest <<< `echo "$pattern"`
  script="`ls $ROOTINSTALLDIR/install_deployment/implement_scripts/ | grep -P \"^$elem(\.sh)?$\"`"
  if [ -n "$script" ]; then
    echo "$script" | while read line2; do
      ./$ROOTINSTALLDIR/implement_scripts/$line2 "$group" "$pattern"
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
