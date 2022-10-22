# yq chops

## Collect Into Object, Retaining Documents

https://mikefarah.gitbook.io/yq/operators/create-collect-into-object

```console
$ kapp inspect -a dockercoins --filter-kind Deployment --raw | \
    yq '[{ "name": .metadata.name, "rollingUpdate": .spec.strategy.rollingUpdate}] | .[]'
```
where:
- `yq '{...}'` builds a single map: the merge of the described objects
- `yq '[{...}]'` maintains document literals, but each built result is an array item
- `yq `[{...}] | .[]'` unpacks the arrays _within_ each document (retaining the document literals)


## Filter Entries of Map Based on an Expression

https://mikefarah.gitbook.io/yq/operators/entries#use-with_entries-to-filter-the-map

```console
$ k get rs -l app=worker -oyaml | \
   yq '.items[] | {"name": .metadata.name, "annotations": .metadata.annotations | with_entries(select(.key == "deployment*"))} | split_doc'
```
where:
- `yq 'with_entries(...)'` operates on a map, given ..., returns the transformed map.

