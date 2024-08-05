#!/bin/bash

set -ex

EKS_CLUSTER_API=${EKS_CLUSTER_API}
EKS_CLUSTER_CA=${EKS_CLUSTER_CA}

sudo /etc/eks/bootstrap.sh --b64-cluster-ca '${EKS_CLUSTER_CA}' --apiserver-endpoint '${EKS_CLUSTER_API}' --container-runtime containerd -kubelet-extra-args '--max-pods=17' -use-max-pods false