#!/bin/bash

# Initializes cluster master node:
kubeadm init --pod-network-cidr=10.244.0.0/16

# We must untaint the node to allow pods to be deployed to our single-node cluster. Otherwise, your pods will be stuck in a pending state.
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes --all node-role.kubernetes.io/control-plane-

# Run test app
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml
