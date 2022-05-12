#!/bin/bash

######################
#   Docker install   #
######################

PKG="docker.io"

if [ "$(dpkg-query -W -f='${Status}' $PKG 2>/dev/null | grep -c "ok installed")" -eq 0 ];
then
    echo "$PKG is not installed! Starting installation..."
    sudo apt-get install docker -y
    sudo usermod -aG docker "$USER"
    sudo service docker start
else
    echo "$PKG is installed. Skipping installation..."
fi

