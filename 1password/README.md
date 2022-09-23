# Installation

1. Installing on a work machine, log in with the `jryan@pivotal.io` account
   - https://start.1password.com/open/i?a=TEWYWIRW3VBYTA5RYVDTHG6HNQ&v=kg5n4dp7ne45eyeb4i3erj6ynq&i=yb4degudbzgldn4kcedgrg4c3a&h=rubiner-ryan.1password.com  
2. Ensure that 1Password SSH Agent is enabled.
3. Symlink the SSH Agent socket:

    ```bash
    cd ~
    mkdir .1password && cd .1password
    ln -s "/Users/<username>/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" .
    ```

jsr-zk://202204112153.md
