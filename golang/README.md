# Golang

## Switching to a specific version of Go

Sometimes, a brew formula needs a later version of Go.
(This happened once when golangci-lint required 1.18 before the Carvel suite transitioned to 1.18).

After installing the dependency, force the the links back to the version you need:
```console
$ brew link --force go@1.17
```
