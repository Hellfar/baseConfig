#!/bin/bash

echo "INSTALL 'node' 6"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
