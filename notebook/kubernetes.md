
# Deploying/Running

- a "STATUS" in `k get pods` output is a _phase_ name, not really a status.
  - `RUNNING` simply means that the containers have been created.


# Networking

- Pods are assigned an IP address in the "cluster network"
- Endpoints (and soon, `EndpointSlices`) collect a list of IP address + Ports.
- 


## Rationale

- IP addresses are assigned to each Pod in order to simplify the overall networking system.
  - it's hard to enforce "only these processes can be listening to those ports"


## Resources

- https://danielfm.me/posts/painless-nginx-ingress.html
