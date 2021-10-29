for key in "${!workerNodes[@]}"; do runtime=$(ssh ${workerNodes[$key]}@$key "sh /usr/local/bin/k3s-uninstall.sh”;ssh ${workerNodes[$key]}@$key "sh /usr/local/bin/k3s-uninstall.sh"); done
