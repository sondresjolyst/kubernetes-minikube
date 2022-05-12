#!/bin/bash
# shellcheck source=/dev/null

###############
#   Install   #
###############

# Will run script and wait. example installScript "./scripts/docker.sh"
function installScript() {
    source "${1}"
    wait # Wait for subshell to finish
    return
}

# Ensure system is fully patched

while true; do
    read -r -p "Do you want to run update && upgrade to ensure that the system is fully patched? [y/n]: (default: Yes) " yn
    case "${yn:-Y}" in
    [Yy]*)
        echo "Running apt-get update..."
        sudo apt-get -qq update
        echo "Running apt-get upgrade..."
        sudo apt-get -qq upgrade -y
        break
        ;;
    [Nn]*)
        echo "Will skip update && upgrade..."
        break
        ;;
    *)
        echo "Please answer yes or no."
        ;;
    esac
done

installScript "./scripts/docker.sh"
installScript "./scripts/kubectl.sh"
installScript "./scripts/minikube.sh"

echo -e "\nInstallation Complete!"