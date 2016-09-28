#!/bin/bash

mkdir -p tmp

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -O tmp/gitkraken-amd64.deb
sudo dpkg -i tmp/gitkraken-amd64.deb
sudo apt-get -f install
