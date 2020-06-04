
## Safely Rewriting History

`git push --force-with-lease`

- the SHA your local tracking branch has is the "lease"
- `git fetch` updates that value, _defeating the protection._
- to keep that protection:
  - OPTION 1: do not `git fetch`.
  - OPTION 2: create a separate remote tracking branch for pushing.
    ```console
    $ git remote set-url --push origin ""
    $ git remote add push-origin (remote-url)
    ```
    update `push-origin` before you make repo edits:
    ```console
    $ git fetch --all
    ```
    feel free to update the fetching origin:
    ```console
    $ git fetch
    ```
    ...make some commits, and...
    ```console
    $ git push push-origin
    
    # ... or if you need to rewrite history, safely
    $ git push --force-with-lease push-origin
    ```
  - OPTION 3: tag the branch before you make repo edits:
    ```console
    $ git fetch --all
    $ git tag base master
    ```
    ...make some commits, and...
    ```console
    $ git push --force-with-lease=master:base (master:master)
    ```

Ref: https://git-scm.com/docs/git-push#Documentation/git-push.txt---force-with-leaseltrefnamegt
