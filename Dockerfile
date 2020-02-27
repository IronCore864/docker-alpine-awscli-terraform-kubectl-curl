FROM python:3.7-alpine3.9

ENV KUBE_LATEST_VERSION="v1.17.3"
ENV TERRAFORM_VERSION="0.12.21"
ENV HELM_BASE_URL="https://get.helm.sh"
ENV VERSION="3.1.1"
ENV TAR_FILE="helm-v${VERSION}-linux-amd64.tar.gz"

RUN apk add --update curl ca-certificates \
  && apk add --update -t deps unzip \
  && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
  && pip install awscli \
  && curl -L ${HELM_BASE_URL}/${TAR_FILE} | tar xvz \
  && mv linux-amd64/helm /usr/bin/helm \
  && chmod +x /usr/bin/helm \
  && rm -rf linux-amd64 \
  && apk del --purge deps \
  && rm /var/cache/apk/*

ENTRYPOINT [ "/bin/sh" ]
