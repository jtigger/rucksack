# vim cheat sheet (tldr)
[go](#window-pane-tab-management)

## Window/Pane/Tab management

Ctrl+W...

**Focus**
- h,j,k,l -- goto split
- w -- walk splits

**Resizing**
- < -- decrease width
- > -- increase width
- + -- increase height
- - -- decrease height

- | -- maximize vertical
- _ -- maximize horizontal
- = -- equalize all splits

**Moving**
- H,J,K,L -- filling half of the window
- T -- to a new tab

## Getting Help / Fishing

:map  -- list mappings for normal, visual, select, and operator modes (i.e. when you're navigating)
:map! -- list mappings for insert and command-line (i.e. when you're typing)

Modes:
- n -- normal
- i -- insert
- c -- command-line
- v -- visual & select

## netrw

- % -- create new file

## Useful References

- Version ... and status of settings.
  ```vim
  :version
  ```
- https://vimhelp.org/ -- vim Help in HTML format

