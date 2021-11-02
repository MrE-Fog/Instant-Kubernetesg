skipFunc() {
  command="$1"
  shift
  if [ $skipStep = true ]; then
    echo 'Would you like to skip this step? (y/n)'
    read skipThisStep
    if [ ${skipThisStep,,} = "n" ] || [ ${skipThisStep,,} = "no" ]; then ${command}; fi
  else ${command}; fi
}

sshFunc() {
  ssh-keygen -t rsa -N '';
  for key in "${!workerNodes[@]}"; do runtime=$(ssh-copy-id ${workerNodes[$key]})@$key; done
}

kubectlFunc() {
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
}

helmFunc() {
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh
}

k3supFunc() {
  curl -sLS https://get.k3sup.dev | sh
  install k3sup /usr/local/bin/
}

serverNodeFunc() {
  k3sup install --ip "$serverNode" --user $serverUserNode --merge --local-path "$HOME/.kube/config" --context my-k3s
  export KUBECONFIG="$(pwd)/.kube/config"
}

workerNodesFunc() {
  for key in "${!workerNodes[@]}"; do runtime=$(k3sup join --ip $key --server-ip $serverNode --user ${workerNodes[$key]}) echo "$key => ${workerNodes[$key]}"; done
}

namespaceFunc() {
  helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
  kubectl create namespace cattle-system
  kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.1/cert-manager.crds.yaml
  helm repo add jetstack https://charts.jetstack.io
  helm repo update
}

certFunc() {
  helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.5.1
  kubectl -n cert-manager rollout status deploy/cert-manager
}
rancherFunc() {
  helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=$dashBoardUrl --set replicas=3 --set ingress.tls.source=letsEncrypt --set letsEncrypt.email=$letsEncryptEmail --set tls=external
  kubectl -n cattle-system rollout status deploy/rancher
}

arkadeFunc() {
  curl -sLS https://get.arkade.dev | sh
  arkade install --help
  echo 'Details to install additional applications and services are listed above, to access the Rancher dashboard please vist:' $dashBoardUrl
}

initFunc() {
  echo -e '███████╗███╗░░██╗███████╗░█████╗░░██████╗████████╗\n██╔════╝████╗░██║██╔════╝██╔══██╗██╔════╝╚══██╔══╝\n█████╗░░██╔██╗██║█████╗░░███████║╚█████╗░░░░██║░░░\n██╔══╝░░██║╚████║██╔══╝░░██╔══██║░╚═══██╗░░░██║░░░\n██║░░░░░██║░╚███║██║░░░░░██║░░██║██████╔╝░░░██║░░░\n╚═╝░░░░░╚═╝░░╚══╝╚═╝░░░░░╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░\nK3s Multi-Node Cluster by don Pablo @donPabloNow\n\nRancher Dashboard with Helm and Arkade Package Managers on a K3S bare-metal multi-Cluster using k3sup. The The installation should not take longer than a few minutes and can be re-run if needed, it may also require that you enter the passwords for the various nodes for various stages of the installation.\n'
  echo 'Step 1 of 6 > What email address would you like to register your free Lets Encrypt SSL certificate with? (i.e. YOUR@EMAIL.COM)'
  read letsEncryptEmail
  echo 'Step 2 of 6 > What address would you like to use for your Rancher Dashboard? (i.e. RANCHER.YOUR-DOMAIN.COM)'
  read dashBoardUrl
  echo 'Step 3 of 6 > What is the username of your Master node? (i.e. root)'
  read serverUserNode
  echo 'Step 4 of 6 > What is the IP of your Master node? (i.e. 10.0.0.1)'
  read serverNode
  echo 'Step 5 of 6 > How many Worker Nodes would you like to setup? (i.e. 3)'
  read workerNodeCount
  echo 'We are almost ready to setup the multi-node cluster, we just need the IP Address and Usernames of the Worker nodes and then we can begin'

  for ((i = 1; i <= $workerNodeCount; i++)); do
    echo 'Worker ' $i ' of ' $workerNodeCount ' > What is the username of Worker ' $i '? (i.e. root)'
    read workerNodeUserName
    echo 'Worker ' $i ' of ' $workerNodeCount ' > What is the IP of Worker ' $i '? (i.e. 10.0.0.' $workerNodeCount ')'
    read workerNodeIP
    workerNodes+=[$workerNodeIP]=$workerNodeUserName
  done

  echo -e 'Step 6 of 6 > Would you like the option to skip various steps during the install? (i.e. Y/N)'

  read skipStep

  if [ ${skipStep,,} = "n" ] || [ ${skipStep,,} = "no" ]; then skipStep=false; else skipStep=true; fi

  echo -e 'READY > Shall we begin? (y/n)'
  read beginInstall

  if [ ${beginInstall,,} = "n" ] || [ ${beginInstall,,} = "no" ]; then exit; fi

}

initFunc

echo -e 'Step 1 of 10 > SSH Access (eg. run ssh-keygen and follow prompts to create SSH key then run ssh-copy-id username@nodeIP to copy SSH key onto each worker node)'
skipFunc sshFunc

echo -e 'Step 2 of 10 > Download and install Kubectl the Kubenetes CLI'
skipFunc kubectlFunc

echo -e 'Step 3 of 10 > Download and install Helm Charts'
skipFunc helmFunc

echo -e 'Step 4 of 10 > Download and install k3sup'
skipFunc k3supFunc

echo -e 'Step 5 of 10 > Deploy K3s on Server/Master Node'
skipFunc serverNodeFunc

echo -e 'Step 6 of 10 > Deploy K3s on Worker Nodes'
skipFunc workerNodesFunc

echo -e 'Step 7 of 10 > Download and install Rancher and Cert-Manager Helm Charts and Namespace'
skipFunc namespaceFunc

echo -e 'Step 8 of 10 >  Install Cert-Manager'
skipFunc certFunc

echo -e 'Step 9 of 10 >  Install Rancher Dashboard'
skipFunc rancherFunc

echo -e 'Step 10 of 10 >  Install Arkade and print help'
skipFunc arkadeFunc
