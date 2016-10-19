#!/bin/bash

mkdir -p tmp

# official latest version
# wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/evoluspencil/evoluspencil_2.0.5_all.deb -O tmp/evoluspencil_2.0.5_all.deb
# sudo dpkg -i tmp/evoluspencil_2.0.5_all.deb
# sudo apt-get -f install

# forked version
wget https://github.com/prikhi/pencil/releases/download/v2.0.18/Pencil-2.0.18-linux.tar.gz -O tmp/Pencil-2.0.18-linux.tar.gz
cd tmp
tar -xvf Pencil-2.0.18-linux.tar.gz
mkdir -p /usr/share/pencil/
mv * /usr/share/pencil/

echo <<"BIN"
#!/bin/sh
#

/usr/bin/firefox --app "/usr/share/pencil/application.ini"
BIN | sudo tee /usr/bin/pencil
