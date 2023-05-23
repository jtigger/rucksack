# Problems and Solutions

## Undesired indentation of text files

Context:
- editing a plain text file (not source)

Symptoms:
- go to use `gq` or similar formatting and there's undesired indentation

Diagnosis:
Indentation is being set for writing source code.

Prescription:
Turn it off.

```
:set nocindent
```
