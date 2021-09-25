# bash script idioms

## common settings for scripts

```bash
set -e -u -o pipefail
set -x
```
- e : exit on err
- u : err when unset variables are used (catches typos)
- pipefail : propagate errors that occur in piped commands
- x : turn on tracing: every command is display before executed

## location of the currently running script

```bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
```
