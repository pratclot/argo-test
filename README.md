# KubeOps Challenge

Setup:
- single node k8s cluster made by minikube
- Argo CD inside that cluster, deployed via Helm
- registry.k8s.io/e2e-test-images/agnhost used as a demo app
- Docker Hub as container registry
- bump2version emulates automated versioning
- `/bin/sleep 30` emulates outage if the app is restarted or redeployed
- sample `monitor.sh` monitoring script can be used to quickly verify outages
