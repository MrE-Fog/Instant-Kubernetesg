# Instant Kubernetes Multi-Node Cluster

Instant Kubernetes Cluster using curl ssh kubectl helm k3s k3sup rancher jetstack arkade

## Install


`$ wget -O - "https://bit.ly/KubeInstall" | serverNode="YOUR-MASTER-NODE-IP" workerNodes="( ['YOUR-WORKER1-SSH-IP']='YOUR-WORKER1-SSH-USERNAME' ['YOUR-WORKER2-SSH-IP']='YOUR-WORKER2-SSH-USERNAME')" bash`

How to add additional worker nodes: workerNodes=( ["YOUR-WORKER1-SSH-IP"]="YOUR-WORKER1-SSH-USERNAME" ["YOUR-WORKER2-SSH-IP"]="YOUR-WORKER2-SSH-USERNAME" ["YOUR-WORKER3-SSH-IP"]="YOUR-WORKER3-SSH-USERNAME" ["YOUR-WORKER4-SSH-IP"]="YOUR-WORKER4-SSH-USERNAME" .... etc)

Example: "wget -O - https://bit.ly/KubeInstall | serverNode="192.168.0.1" workerNodes="( ['192.168.1.1']='root' ['192.168.2.1']='root')" bash"

``

## Uninstall

`$ wget -O - "https://bit.ly/KubeRemove" | serverNode="YOUR-MASTER-NODE-IP" workerNodes="( ['YOUR-WORKER1-SSH-IP']='YOUR-WORKER1-SSH-USERNAME' ['YOUR-WORKER2-SSH-IP']='YOUR-WORKER2-SSH-USERNAME')" bash`

``

## Demo

[![asciicast](https://www.veed.io/embed/d931db75-24a7-481c-aa48-48be191c61c9)

## Cluster Addons

**Application**|**Installation**
:-----:|:-----:
argocd|Install argocd
cassandra|Install cassandra
cert-manager|Install cert-manager
chart|Install the specified helm chart
cockroachdb|Install CockroachDB
consul-connect|Install Consul Service Mesh
cron-connector|Install cron-connector for OpenFaaS
crossplane|Install Crossplane
docker-registry|Install a Docker registry
falco|Install Falco
gitea|Install gitea
gitlab|Install GitLab
grafana|Install grafana
influxdb|Install influxdb
ingress-nginx|Install ingress-nginx
inlets-operator|Install inlets-operator
istio|Install istio
jenkins|Install jenkins
kafka|Install Confluent Platform Kafka
kafka-connector|Install kafka-connector for OpenFaaS
kong-ingress|Install kong-ingress for OpenFaaS
kube-image-prefetch|Install kube-image-prefetch
kube-state-metrics|Install kube-state-metrics
kubernetes-dashboard|Install kubernetes-dashboard
kyverno|Install Kyverno
linkerd|Install linkerd
loki|Install Loki for monitoring and tracing
metallb-arp|Install MetalLB in L2 (ARP) mode
metrics-server|Install metrics-server
minio|Install minio
mongodb|Install mongodb
mqtt-connector|Install mqtt-connector for OpenFaaS
nats-connector|Install OpenFaaS connector for NATS
nfs-client-provisioner|Install nfs client provisioner
nginx-inc|Install nginx-inc for OpenFaaS
opa-gatekeeper|Install Open Policy Agent (OPA) Gatekeeper
openfaas|Install openfaas
openfaas-ingress|Install openfaas ingress with TLS
openfaas-loki|Install Loki-OpenFaaS and Configure Loki logs provider for OpenFaaS
osm|Install osm
portainer|Install portainer to visualise and manage containers
postgresql|Install postgresql
rabbitmq|Install rabbitmq
redis|Install redis
registry-creds|Install registry-creds
sealed-secrets|Install sealed-secrets
tekton|Install Tekton pipelines and dashboard
traefik2|Install traefik2
