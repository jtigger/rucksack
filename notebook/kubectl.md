
## Authoring Resources

- API Docs
    - ... for a resource
        ```console
        $ kubectl explain service.spec
        ```
    - ... for a hierarchy of resources
        ```console
        $ kubectl explain deployment.spec.template.spec.dnsConfig --recursive
        ```

## Troubleshooting

- get a shell on a container
    - ... (pod with one container)
        ```console
        $ kubectl exec -it ${POD_NAME} -- /bin/bash
        ```
    - .. (pod with multiple containers)
        ```console
        $ kubectl exec -it ${POD_NAME} -c ${CONTAINER_NAME} -- /bin/bash
        ```

