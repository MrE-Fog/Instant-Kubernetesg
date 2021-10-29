# How to Get a Multi-Node Cluster Instantly: 
### Deploy Your Kubernetes Cluster in Seconds


Instant Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.  using curl is used in command lines or scripts to transfer data, Secure Shell (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network, The Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters, Helm helps you manage Kubernetes applications — Helm Charts help you define, install, and upgrade even the most complex Kubernetes application, K3s is a highly available, certified Kubernetes distribution designed for production workloads in unattended, resource-constrained, remote locations or inside, k3sup (said 'ketchup') ... k3sup is a light-weight utility to get from zero to KUBECONFIG with k3s on any local or remote VM, Rancher is a complete software stack for teams adopting containers, and arkade provides a portable marketplace 


## INDEX:

 - [Instant Install](#Instant-Install)
 - [Uninstall](#Uninstall)
 - [Demo](#Demo)
 - [Cluster Addons](#Cluster-Addons)
 - [What is Kubernetes?](#What-is-Kubernetes?)
 - [Manual Installing-steps](#Manual-Installing-steps)
 - [Deploying Kubernetes using kubectl](#Deploying-Kubernetes-using-kubectl)
 - [What happens if more than one node fails?](#What-happens-if-more-than-one-node-fails?)
 - [Helm Applications Manager](#Helm-Applications-Manager)
 - [K3s Kubernetes clusters](#K3s-Kubernetes-clusters)
 - [Rancher Complete Software Stack](#Rancher-Complete-Software-Stack)
 - [Credit](#Credits)
 - [Conclusion](#Conclusion)

# Instant Kubernetes Multi-Node Cluster

Instant Kubernetes Cluster using curl ssh kubectl helm k3s k3sup rancher jetstack arkade

```$ wget -O - "https://bit.ly/KubeInstall" | letsEncryptEmail="email@example.com" dashBoardUrl="rancher.example.com" serverNode="YOUR-MASTER-NODE-IP" workerNodes="( ['YOUR-WORKER1-SSH-IP']='YOUR-WORKER1-SSH-USERNAME' ['YOUR-WORKER2-SSH-IP']='YOUR-WORKER2-SSH-USERNAME')" bash```

How to add additional worker nodes: workerNodes=( ["YOUR-WORKER1-SSH-IP"]="YOUR-WORKER1-SSH-USERNAME" ["YOUR-WORKER2-SSH-IP"]="YOUR-WORKER2-SSH-USERNAME" ["YOUR-WORKER3-SSH-IP"]="YOUR-WORKER3-SSH-USERNAME" ["YOUR-WORKER4-SSH-IP"]="YOUR-WORKER4-SSH-USERNAME" .... etc)

Example: "wget -O - https://bit.ly/KubeInstall | letsEncryptEmail="email@example.com" dashBoardUrl="rancher.example.com" serverNode="192.168.0.1" workerNodes="( ['192.168.1.1']='root' ['192.168.2.1']='root')" bash"


# Uninstall

```$ wget -O - "https://bit.ly/KubeRemove" | serverNode="YOUR-MASTER-NODE-IP" workerNodes="( ['YOUR-WORKER1-SSH-IP']='YOUR-WORKER1-SSH-USERNAME' ['YOUR-WORKER2-SSH-IP']='YOUR-WORKER2-SSH-USERNAME')" bash```


# Demo

<a href="https://www.veed.io/embed/d931db75-24a7-481c-aa48-48be191c61c9"><img src="https://i.ytimg.com/vi/TSo3ugxY3OI/maxresdefault.jpg" /></a>

`Example: "wget -O - https://bit.ly/KubeInstall | letsEncryptEmail="email@example.com" dashBoardUrl="rancher.example.com" serverNode="192.168.0.1" workerNodes="( ['192.168.1.1']='root' ['192.168.2.1']='root')" bash"`


# Cluster Addons

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

# What is Kubernetes?


What is Kubernetes? The Kubernetes project was born in 2014 and Google released the alpha version in early 2015. Kubernetes was created to build an open-source system for automating deployment, scaling, and management of containerized applications. It utilizes pods to connect and manage these containers and is written in Go. The reason this is important is that Go, in a way, is as close to C++ as you can get. The two main projects behind it are a software container orchestrator named pod, developed by Google, and a container runtime called Tectonic, developed by Docker.


# Manual Install Steps



kubectl is a command-line tool for administering Kubernetes clusters. kubectl creates a new Kubernetes cluster by telling the kubernetes cluster manager how many nodes you want and a name for your cluster. In this example you are creating a cluster of two nodes. In the next step, you will do the same but you will create another cluster of three nodes. When the two cluster nodes are created, you will set the names of both the cluster nodes using the addNode method. You must specify the names of the node and the node type: kubectl create -f kubernetes.yaml



Add these nodes to the existing Kubernetes cluster (installing nodes)



kubectl create -f kubernetes.



#Deploying Kubernetes using kubectl


In order to setup a multi-node cluster, simply use the following command:



kubectl get nodes NAME STATUS AGE k1-10 Ready 5m k1-13 Ready 5m k2-10 Ready 5m k2-13 Ready 5m k3-10 Ready 5m k3-13 Ready 5m



# What happens if more than one node fails?



Kubectl runs a 'batch job' in a separate Kubernetes node, and kills any unavailable pods with a timeout. The nodes will be automatically rebooted as well if a cluster leaves a multi-node-network configuration.



You can easily change the cluster nodes in the kubectl config file, by adding the nodeId to the manifest in cluster configuration file. This may not be necessary if you can specify the 'nodes' attribute in the resources inside your cluster but, if you are not using kubeadm, then you will need to add the nodes' name to your kube-system.



# Helm Kubernetes Applications Manage


Installation and usage of Kubernetes: Linux, Kubernetes and Beyond



To create a new Kubernetes cluster, the name and it's version number should be specified. The steps are:



$ kubectl create -f launchconfig.yml



or $ kubectl create -f api.yml



or $ kubectl create -f handlers.yml



$ kubectl create -f client-api.yml



or $ kubectl create -f commands.yml



or $ kubectl create -f flannel.yml



or $ kubectl create -f fleet.yml



Note: When creating a multi-node cluster in one go, use the default options for both K8s and Kubernetes.


# K3s Kubernetes clusters


Rapid Deployment and Scalability is the core of Docker Swarm, Kubernetes and Mesos, the three heavyweight container orchestration systems available today. And like many other popular open source projects, all three have had some difficult moments over the last year, as support and engagement with their respective users has eroded. In the age of Docker, Kubernetes and Mesos, if you're not building a 'Kubernetes app', you're building an 'App Container' that will die in a few minutes, because you're deploying just the pieces of the application. Some users see it as a no-win situation.



# Rancher Complete Software Stack


We all want to work with the largest possible number of users. Containers allow us to organize applications into container clusters. We use Kubernetes and K8s to configure, run, and monitor our clusters. To be clear, Kubernetes and K8s are just one small piece of a bigger puzzle. There are many other tools that can be used to manage, scale, and secure your container-based application. These include docker, virt-manager, and vROPS, to name just a few.



A simple way to deploy Kubernetes in your company is to use the right tool for the job.


# Credits



# Conclusion


Infrastructure automation is a term of the day, and Kubernetes is leading the way for infrastructure automation. Kubernetes is gaining popularity rapidly, and that's for a reason. It is flexible and adaptable. Since there's always a room for improvement, Kubernetes developers are constantly thinking about how to build a better system. However, if you are interested in the basics, you can download Kubernetes from the official website.
