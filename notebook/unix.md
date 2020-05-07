

## Diagnostics

- install network diagnostic tools
    ```console
    $ apt-get install net-tools
    ```
- list ports with listeners
    - ... on most unix distros
        ```console
        (sudo) netstat -ptunl
        ```
        - `l` = listening ports only
        - `t` = include TCP ports
        - `u` = include UDP ports
        - `n` = numerical (IP address) not hostnames
        - `p` = include the PID of the listening process (requires sudo)
    - ... on OS X
        ```console
        lsof -nP 
        ```