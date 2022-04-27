#!/bin/bash
####################
#   Ubuntu 20.04   #
####################
# Ensure system is fully patched
sudo apt-get update
sudo apt-get upgrade -y

# Docker install
sudo apt-get install docker
sudo usermod -aG docker $USER && newgrp docker
sudo service docker start

# Bash Complete
sudo apt-get install bash-completion
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
minikube dashboard

