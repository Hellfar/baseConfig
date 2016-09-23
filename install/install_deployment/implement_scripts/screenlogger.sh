#!/bin/bash

IFS=: read origin dest <<< `echo "$2"`

# screen logger
sudo cp "$origin" "$dest"
sudo chmod ugo+x /etc/init.d/screenlogger
sudo update-rc.d screenlogger defaults
