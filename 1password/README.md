# Installation

1. In 1Password desktop app, log in with the accounts to be used.
   - MO: `john@mechanical-orchard.com`
   - JTigger: `jtigger@pm.me`
2. Ensure that 1Password SSH Agent is enabled.
3. Symlink the SSH Agent socket:

    ```bash
    cd ~
    mkdir ~/.config/1Password
    cd ~/.config/1Password
    ln -s $HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock .
    ```
4. Symlink the SSH Agent configuration

    ```bash
    mkdir -p ~/.config/1Password/ssh
    cd ~/.config/1Password/ssh 

    # for work machine
    ln -s ~/rucksack/1password/mechanical-orchard.agent.toml agent.toml

    # for personal machine
    ln -s ~/rucksack/1password/jtigger.agent.toml agent.toml
    ```

