# About k8stools
This is a simple docker container based on centos with these tools:
 - kubectl [you know]
 - helm [Kubernetes Package Administration]
 - flux [GitOps Toolkit]
 - linkerd [Lighweight Kubernetes Service Mesh]
 - kubectx [Switch contexts easily]
 - kubens [Switch namespaces easily]
 - http [user-friendly command-line HTTP client for the API era]
 - git 
 - curl
 - wget
 - nslookup
 - tcpdump
 - ifconfig/ip
 - vim

How to use:
```bash
docker run -v /home/yourUSer/.kube:/home/k8stools/.kube -it rafaelperoco/k8stools
```
