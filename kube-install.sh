####################
#   Ubuntu 20.04   #
####################
# Ensure system is fully patched
sudo apt-get update
sudo apt-get upgrade -y

# Docker install
sudo apt-get install docker

# Bash Complete
sudo apt-get install bash-completion
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

# Kubernetes Install
