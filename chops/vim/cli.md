# vim Command-Line

## Open a set of files, each in their own split

```console
$ vim -o file1.txt file2.txt ...
```
where:
- `-o` (mnemonic: "open") horizontal splits
- `-O` vertical splits

```console
$ vim -p file1.txt file2.txt
```
where:
- `-p` (mnemonic: "open side-by-side [as p comes after o]") each file in its own tab
