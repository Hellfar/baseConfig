#!/bin/bash

./.bin/iniLoader.sh ".*" install_list | while read line; do
  echo "$line"
done
