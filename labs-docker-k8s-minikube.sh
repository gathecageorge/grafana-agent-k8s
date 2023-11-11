#!/bin/bash

apk add gcompat 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
sudo install minikube-linux-amd64 /usr/local/bin/minikube 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
minikube start --extra-config=apiserver.bind-address=0.0.0.0 --force

# Use openebs local class for storage class
sed -i.bak '1,8d; s/my-storage-class/standard/' main.yml
