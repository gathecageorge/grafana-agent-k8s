#!/bin/bash

kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16

kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml
# kubectl delete -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml

kubeadm join 192.168.0.23:6443 --token ky2d7t.tbmmveok8ilmumnu --discovery-token-ca-cert-hash sha256:e3845e7b704f9b4fa69783cef67b9a28ba2471b764d5a413d51d0020b98e7f14 