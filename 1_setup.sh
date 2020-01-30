#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )";
source $SCRIPT_PATH/.env;

#update system
sudo apt-get update

#download kops
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/

#download kubectl
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#install pip3
sudo apt-get install python3-pip

#install awscli
sudo apt-get install awscli
pip3 install awscli

