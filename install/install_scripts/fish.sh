#!/bin/bash

mkdir -p tmp

sudo apt-get install build-essential ncurses-dev libncurses5-dev gettext autoconf -y

autoconf
./configure
make
sudo make install

echo /usr/local/bin/fish | sudo tee -a /etc/shells

chsh -s /usr/local/bin/fish

# to turn it back
# chsh -s /bin/bash
