#!/bin/bash

IFS=: read origin dest <<< `echo "$2"`

# screen logger
sudo cp install/install_deployment/"$origin" "$dest"
sudo chmod ugo+x "$dest"
sudo update-rc.d screenlogger defaults
