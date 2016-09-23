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
      "gem")
        gem install "$soft"
        ;;
    esac
  fi
done

# rm -rf install.sh install_script

# screen logger
printf <<INITLOGGER
#!/bin/bash
### BEGIN INIT INFO
# Provides:          screenlogger
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: screenlogger
# Description:       screenlogger
### END INIT INFO

if [ -e "$HOME/.bin/screenlogger.sh" ]
then
  ~/.bin/screenlogger.sh
fi
INITLOGGER | sudo tee /etc/init.d/screenlogger
sudo chmod ugo+x /etc/init.d/screenlogger
sudo update-rc.d screenlogger defaults
