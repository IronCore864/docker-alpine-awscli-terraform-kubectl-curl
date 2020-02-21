# Docker for AWS CLI

Alpine base, with:

- python 3.7
- aws cli
- terraform 0.12.21
- kubectl 1.17.3
- curl

## Build

```
docker build . -t ironcore864/awscli-terraform-curl-kubectl:latest
```

## Push
```
docker push ironcore864/awscli-terraform-curl-kubectl:latest
```
