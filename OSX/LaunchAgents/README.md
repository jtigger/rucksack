# Launch Agents

This directory contains Launch Agent configurations for background services that should run on macOS startup.

## Fix Input Volume Service

The `com.user.fix-input-volume.plist` Launch Agent ensures that the input volume is continuously maintained at the desired level (100).

### Setup

1. Create the LaunchAgents directory if it doesn't exist:
   ```bash
   mkdir -p ~/Library/LaunchAgents
   ```

2. Symlink the plist file:
   ```bash
   cd ~/Library/LaunchAgents
   ln -s ~/rucksack/OSX/LaunchAgents/com.user.fix-input-volume.plist .
   ```

3. Load the Launch Agent:
   ```bash
   launchctl load ~/Library/LaunchAgents/com.user.fix-input-volume.plist
   ```

4. Verify it's running:
   ```bash
   launchctl list | grep fix-input-volume
   ```

### Management

- **Start**: `launchctl load ~/Library/LaunchAgents/com.user.fix-input-volume.plist`
- **Stop**: `launchctl unload ~/Library/LaunchAgents/com.user.fix-input-volume.plist`
- **View logs**: 
  - Output: `tail -f /tmp/fix-input-volume.out`
  - Errors: `tail -f /tmp/fix-input-volume.err`

### Configuration

The Launch Agent is configured to:
- Run automatically on login (`RunAtLoad: true`)
- Restart if it crashes (`KeepAlive: true`)
- Set input volume to 100
- Throttle restarts to prevent excessive resource usage (`ThrottleInterval: 1`)
- Log output and errors to `/tmp/`

To change the volume level, edit the plist file and change the `100` argument to your desired level, then reload:
```bash
launchctl unload ~/Library/LaunchAgents/com.user.fix-input-volume.plist
launchctl load ~/Library/LaunchAgents/com.user.fix-input-volume.plist
``` 