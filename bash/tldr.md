# bash script idioms

## common settings for scripts

```bash
set -o errexit -o nounset -o pipefile
set -o xtrace
```
shortened:
```bash
set -e -u -o pipefail
set -x
```

## location of the currently running script

```bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
```
