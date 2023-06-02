# Troublehsooting Visual Studio Code for Elixir Setup


Getting this error":
```
OTP compiled without EEP48 documentation chunks
```

Per https://stackoverflow.com/questions/74559444/how-to-fix-vscode-extension-elixirls-alert-otp-compiled-without-eep48-documenta

Configure the Erlang plugin for asdf to generate the documentation

Install the Erlang documentation:
  https://github.com/asdf-vm/asdf-erlang#getting-erlang-documentation

```shell
KERL_BUILD_DOCS=yes asdf install erlang 25.1.2
```
