# Instant Kubernetes Multi-Node Cluster

Instant Kubernetes Cluster using curl ssh kubectl helm k3s k3sup rancher jetstack arkade

## Install


`wget -O - "https://bit.ly/KubeInstall" | serverNode="YOUR-MASTER-NODE-IP" workerNodes="( ['YOUR-WORKER1-SSH-IP']='YOUR-WORKER1-SSH-USERNAME' ['YOUR-WORKER2-SSH-IP']='YOUR-WORKER2-SSH-USERNAME')" bash`

How to add additional worker nodes: workerNodes=( ["YOUR-WORKER1-SSH-IP"]="YOUR-WORKER1-SSH-USERNAME" ["YOUR-WORKER2-SSH-IP"]="YOUR-WORKER2-SSH-USERNAME" ["YOUR-WORKER3-SSH-IP"]="YOUR-WORKER3-SSH-USERNAME" ["YOUR-WORKER4-SSH-IP"]="YOUR-WORKER4-SSH-USERNAME" .... etc)

Example: `#"wget -O - https://bit.ly/KubeInstall | serverNode="192.168.0.1" workerNodes="( ['192.168.1.1']='root' ['192.168.2.1']='root')" bash"`

``

## Uninstall

`wget -O - "https://bit.ly/KubeRemove" | serverNode="YOUR-MASTER-NODE-IP" workerNodes="( ['YOUR-WORKER1-SSH-IP']='YOUR-WORKER1-SSH-USERNAME' ['YOUR-WORKER2-SSH-IP']='YOUR-WORKER2-SSH-USERNAME')" bash`

``
