# ArgoCD: Echo Application

This folder contains an ArgoCD `Application` manifest that deploys a simple HTTP echo service.

Files:

- `manifests/echo/deployment.yaml` — Deployment running `hashicorp/http-echo`.
- `manifests/echo/service.yaml` — ClusterIP Service exposing the deployment.
- `argocd/echo-application.yaml` — ArgoCD `Application` CR which points to `manifests/echo`.

Usage:

1. Update `argocd/echo-application.yaml` and replace `REPLACE_WITH_YOUR_REPO_URL` with your repository HTTPS URL (the repo ArgoCD has access to).

2. Apply the ArgoCD Application to your ArgoCD server namespace (usually `argocd`):

```bash
# from the repo root
kubectl apply -f argocd/echo-application.yaml
```

3. ArgoCD will sync the `manifests/echo` directory and create the Deployment and Service in the `default` namespace.

Notes:
- The Application is configured to `automated` sync with `prune` and `selfHeal` enabled.
- Change `destination.namespace` in `argocd/echo-application.yaml` if you want a different target namespace.
