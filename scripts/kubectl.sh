#!/bin/bash

#######################
#   Kubectl install   #
#######################

PKG="kubectl"

if [ "$(dpkg-query -W -f='${Status}' $PKG 2>/dev/null | grep -c "ok installed")" -eq 0 ];
then
    echo "$PKG is not installed! Starting installation..."
    sudo apt-get install -y apt-transport-https ca-certificates curl
    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
else
    echo "$PKG is installed. Skipping installation..."
fi
