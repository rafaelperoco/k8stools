FROM centos

RUN useradd -ms /bin/bash k8stools
WORKDIR /home/k8stools

RUN yum update -y

RUN yum install -y \
  wget \
  git \
  curl \
  iproute \
  epel-release \
  net-tools \
  bind-utils \
  vim \
  tcpdump \
  nodejs

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin

RUN  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
  && chmod 700 get_helm.sh \
  && ./get_helm.sh \
  && rm get_helm.sh

RUN curl -s https://toolkit.fluxcd.io/install.sh | bash

RUN curl -sL run.linkerd.io/install | bash

RUN wget -O /usr/bin/kubectx https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubectx \
  && chmod +x /usr/bin/kubectx \
  && wget -O /usr/bin/kubens https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubens \
  && chmod +x /usr/bin/kubens

RUN wget -O /home/k8stools/.kubectl_aliases https://rawgit.com/ahmetb/kubectl-alias/master/.kubectl_aliases \
  && echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> /home/k8stools/.bashrc

RUN npm i -g cfonts \
  && echo "npx cfonts "k8stools" -f slick --colors "#326CE5",white" >> /home/k8stools/.bashrc

USER k8stools
