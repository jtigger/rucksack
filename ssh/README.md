## Overview

- All ssh keys live in 1Password.
- keys are selected by munged-hostname.

logseq://graph/jsr-pkm?page=Configuring%20ssh%20config%20for%20multiple%20GitHub%20identities

## Installation

For each identity/SSH Key to configure:
1. from 1Password, within the SSH Key record, in the "public key", download it.
2. move key into ssh config:
   ```bash
   $ ~/downloads/id_ed25519.pub ~/.ssh/IDENTITY-id_ed25519.pub
   ```
3. add an entry into the `~/.ssh/config` mapping a munged hostname to an identity:

   ```sshconfig
   Host IDENTITY-github.com
     User git
     Hostname github.com
     IdentityFile ~/.ssh/IDENTITY-id_ed25519.pub
     IdentitiesOnly yes
     IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
   ```
4. from 1Password, copy signing configuration put signing configuration in `~/.gitconfig-sign`

