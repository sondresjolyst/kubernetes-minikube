# kubernetes-minikube-setup

To ensure the system is fully patched the script will run **apt-update update && upgrade**, then it will proceed with installing the following packages:

- Docker:Latest
- Bash-completion
- Kubernetes:Stable
- Minikube:latest

 After the packages are installed it will run **minikube start --driver=docker**.
 To open the kubernetes dashboard use **minikube dashboard &**
