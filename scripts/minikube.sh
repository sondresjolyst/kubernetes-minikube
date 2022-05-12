#!/bin/bash

########################
#   Minikube install   #
########################

PKG="minikube"

if [ -f "/usr/local/bin/$PKG" ]; then
    echo "$PKG is installed. Skipping installation..."
else
    echo "$PKG is not installed! Starting installation..."
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x ./minikube
    sudo mv ./minikube /usr/local/bin/
fi

if  minikube status | grep -c -q "host: Running"; then
    echo "Minikube is running!"
else
    while true; do
        read -r -p "Minikube is not running. Do you want to start it?: (default: yes) " yn
        case "${yn:-Y}" in
        [Yy]*)
            echo "Starting minikube..."
            minikube start --driver=docker
            minikube status
            echo -e "\nTo Access kubernets dashboard please type 'minikube dashboard', \nif you want the proccess to run in the background just add '&' at the end"
            break
            ;;
        [Nn]*)
            echo "Will not start minikube."
            break
            ;;
        *)
            echo "Please answer yes or no."
            ;;
        esac
    done
fi
