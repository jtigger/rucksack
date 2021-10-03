# docker cheat sheet

## Run a command against a host directory

```bash
docker run --rm -v `pwd`:/host golang:1.17 bash -c "cd /host && go build ."
```
where
- `--rm` : remove the container when it terminates
- `-v (path-on-host : container-mount-point)` : mount host directory within the container
- `bash -c ...` : run a set of commands, not just one
