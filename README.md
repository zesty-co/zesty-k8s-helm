# Zesty K8s Helm Chart

> Helm chart for Zesty k8s

## Installation

> IMPORTANT: Zesty requires org ID and key to work.
> You can get those during onboarding on the Zesty platform.

1. Add the Zesty helm chart repo to your client configuration
```sh
helm repo add zesty https://zesty-co.github.io/zesty-k8s-helm
helm repo update
```
2. Search the repo to make sure it's set up
```
$ helm search repo zesty
NAME                    CHART VERSION   APP VERSION     DESCRIPTION
zesty/zesty-k8s-helm    0.1.33          1.0.8           A Helm chart for Kubernetes
```
3. Install the chart
```sh
helm install zesty-k8s --set orgID=<ORG_ID> --set encryptedCredentials=<KEY> zesty/zesty-k8s-helm --namespace <NAMESPACE> --create-namespace
```

## Uninstalling
```sh
helm delete zesty
```
