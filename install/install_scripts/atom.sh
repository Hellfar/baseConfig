#!/bin/bash

mkdir -p tmp

wget https://atom.io/download/deb -O tmp/atom-amd64.deb
sudo dpkg -i tmp/atom-amd64.deb
sudo apt-get -f install
