# KubeOps Challenge

Setup:
- single node k8s cluster made by `minikube`
- Argo CD inside that cluster, deployed via `helm`
- `registry.k8s.io/e2e-test-images/agnhost` used as a demo app
- Docker Hub as container registry
- GitHub Action that automatically bumps app version, pushes new images and git tags (God bless Chat GPT!)

Some helpers:
- `bump2version` emulates automated versioning
- `/bin/sleep 30` emulates outage if the app is restarted or redeployed
- sample `monitor.sh` monitoring script can be used to quickly verify outages

## Challenge requirements

- [x] Outage-free deployments are achieved via [readiness probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes).
- [x] Multi-environment deployments are enabled by `Kustomize`.
- [x] Argo CD apps are generated from `ApplicationSet` resource

## Bugs

- I probably forgot to patch some metadata which results in pods belonging to both `dev` and `staging` deployments.

## Tips

- to test the "outage-enabled" image locally:
```bash
docker run --network host --entrypoint "sh" registry.k8s.io/e2e-test-images/agnhost:2.39 -c 'sleep 5 && ./agnhost netexec --http-port=8085'
```

and then in another terminal:
```bash
./monitor.sh localhost:8085
```
- one more tip here
