# Docker for AWS CLI

Alpine base, with:

- python 3.7
- aws cli
- terraform 0.12.21
- kubectl 1.17.3
- curl
- helm3

## Build

```
docker build . -t ironcore864/awscli-terraform-curl-kubectl:latest
```

## Push
```
docker push ironcore864/awscli-terraform-curl-kubectl:latest
```

## Usage

When creating EKS/k8s with terraform, you might need to:
- run aws cli to get cluster kube config
- run curl to access EKS API to make sure it's already created (so that you can run other tasks like creating k8s resources in it)
- run kubectl to create resources using terraform local-exec

That's why it's nice to have aws cli, tf, kubectl, curl all together.

Run as user ID 1000.
