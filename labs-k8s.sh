#!/bin/bash

# Initializes cluster master node:
kubeadm init --pod-network-cidr=10.244.0.0/16

# We must untaint the node to allow pods to be deployed to our single-node cluster. Otherwise, your pods will be stuck in a pending state.
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes --all node-role.kubernetes.io/control-plane-

# For networking to function, you must install a Container Network Interface (CNI) plugin. With this in mind, we’re installing flannel.
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Install Helm
export VERIFY_CHECKSUM=false
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# We need to install a Container Storage Interface (CSI) driver for the storage to work. We’ll install OpenEBS.
helm repo add openebs https://openebs.github.io/charts
kubectl create namespace openebs
helm --namespace=openebs install openebs openebs/openebs

# Run test app
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml

# Use openebs local class for storage class
sed -i.bak '1,9d; s/my-storage-class/openebs-hostpath/' main.yml

