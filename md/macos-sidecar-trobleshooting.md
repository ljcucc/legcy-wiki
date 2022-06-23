---
title: macOS Sidecar trobleshooting
...

Sometimes sidecar just have some wierd issue.

## Resolution is not reseted from mac's to iPad's resolution

> References: https://github.com/waydabber/BetterDisplay/discussions/349

To fix this. remove `com.apple.windowserver.displays.plist` from `/Library/Preferences` and `~/Library/Preferences/ByHost`, here's a script for doing that:

```bash
cd ~/Library/Preferences/ByHost; rm $( ls | grep com.apple.windowserver )
```

and restart sidecar.