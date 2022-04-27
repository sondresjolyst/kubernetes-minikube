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

# Kubernetes Install
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x ./minikube
sudo mv ./minikube /usr/local/bin/

minikube start --driver=docker

echo "To Access kubernets dashboard please type 'minikube dashboard', 
if you want the proccess to run in the background just add '&' at the end"