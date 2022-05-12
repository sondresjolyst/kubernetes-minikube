# Kubernetes-minikube
A Kubernetes Minikube script that installs docker, kubectl and minikube for you.

## Quick Start
Start installation:

    $ ./install.sh

If your not able to start **./install.sh** it could be that the file is missing the **Execute permission**:

    chmod +x ./install.sh

### What will the script install?
- Docker : Latest
- Kubernetes : Stable
- Minikube : Latest
	- After installation you will be prompted the option to start minikube.

### Want to add more programs to the script?
The script will run **source** for every file ending with **.sh** in the **./scripts/*** folder.

## Documentation links

| Project   | Links                             |
|-----------|-----------------------------------|
| Docker    | https://docs.docker.com/          |
| Kubernetes| https://kubernetes.io/docs/home/  |
| Minikube  | https://minikube.sigs.k8s.io/docs/|