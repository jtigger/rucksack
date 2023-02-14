## kubectl

### Port Forwarding

```
$ kubectl port-forward ${POD_NAME} ${HOST_PORT}:${CLUSTER_PORT}
```

### Merge Config Contexts

```
$ cp ~/.kube/config ~/.kube/config.bak
$ KUBECONFIG=~/.kube/config:/path/to/new/config kubectl config view --flatten > ~/.kube/new-config
$ mv ~/.kube/new-config ~/.kube/config
```
