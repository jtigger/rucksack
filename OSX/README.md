
## Install

## Manual Configuration Tweaks

- In Alfred:
  - Contacts > Advanced >
    - [x] Show title if available  _(includes "Dr." titles)_
    - [x] Use Spotlight metadata for searching contacts  _(searches on more fields than name)_
- System Preferences:
  - Keyboard > Shortcuts 
    - Mission Control = [Shift+Crtl+Opt+Cmd]+Up        # GoLand: "Previous Method"
    - Application windows = [Shift+Crtl+Opt+Cmd]+Down  # GoLand: "Next Method" 
    - Notification Center = [Shift+Opt+Cmd]+Left
    - Show Desktop = [Shift+Crtl+Opt+Cmd]+F11
- iTerm2
  - Preferences > Profiles > Text
    - Cursor 
      - (o) Underline
      - [x] Blinking Cursor
    - Text Rendering
      - [x] Draw bold text in bold font
      - [x] Italic text               # (202208131312.md)
      
    - Font
      - Font = "Source Code Pro"      # (see install location, below)
      - v|i = 90                      # fit more text while being readable
      - [x] Use ligatures             # allows for nicer looking characters (at some speed cost I haven't noticed)
      - [x] Anti-aliased              # smoother font rendering for easier reading
  - Preferences > Profiles > Colors
      - Color Preset: "Solarized Light"
      - Cursor Colors:
        - Cursor: (bright green)      # to make it easier to find cursor while in YAML files (or other that use dashes)
  - Preferences > Profiles > Keys
      - Left Option Key (o) Esc+

## Additional Tools to Install

- [ ] Docker Desktop for Mac

## Others

- Source Pro Font : https://github.com/adobe-fonts/source-code-pro/releases/tag/variable-fonts
  - select for iTerm2 Profile
  - (comes with JetBrains IDEs)
