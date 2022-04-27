# Kubernetes-minikube

To ensure the system is fully patched the script will run **apt-update update && upgrade**, then it will proceed with installing the following packages:

- Docker:Latest
- Bash-completion
- Kubernetes:Stable
- Minikube:latest

 After the packages are installed it will run **minikube start --driver=docker**

## Useful Links
 
| Project				| Links																              |
|------------|------------------------------------|
| Docker					| https://docs.docker.com/						     |
| Kubernetes | https://kubernetes.io/docs/home/		 |
| Minikube			| https://minikube.sigs.k8s.io/docs/ |
