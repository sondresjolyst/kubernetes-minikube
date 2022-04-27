#!/bin/bash

####################
#   Kube install   #
####################

# Ensure system is fully patched
sudo apt-get update
sudo apt-get upgrade -y

# Docker install
sudo apt-get install docker -y
sudo usermod -aG docker $USER
sudo service docker start

# Bash Complete
sudo apt-get install bash-completion -y
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
sudo apt autoremove

# Kubectl Install
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x ./minikube
sudo mv ./minikube /usr/local/bin/

minikube start --driver=docker

echo -e "\nTo Access kubernets dashboard please type 'minikube dashboard', \nif you want the proccess to run in the background just add '&' at the end"