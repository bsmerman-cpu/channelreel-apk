# ChannelReel for Fire TV

Public download of the Android/Fire TV test APK. This repository contains only the installable APK and its checksum; it does not contain an IPTV subscription, account credentials, or channel content.

## Current build

- Version: **2.2.32** (version code 2032)
- File: [channelreel-fire-tv-2.2.32.apk](channelreel-fire-tv-2.2.32.apk)
- Package: `tv.ember.app`
- Minimum Android API: 25 (Fire OS 6)
- SHA-256: `bb28f280bfbfbc683e14d1c1eff8e8ad647bd66c345d7a3725dae5c093ed9397`

The provider address is fixed to `http://channelreeltv.xyz`. Enter your own username and password in Account; neither credential is built into this public APK. This provider uses unencrypted HTTP, so the app asks you to acknowledge that before connecting.

The existing Downloader code **9616773** still points to [channelreel-fire-tv-2.2.25.apk](channelreel-fire-tv-2.2.25.apk). That filename is retained as a stable compatibility download path and now serves the same 2.2.32 APK. Use the 2.2.32 link above for a versioned download.

Download the APK and install it using your device's normal sideloading flow. It updates an existing ChannelReel installation signed with the same test key. You must supply your own provider account in the app.

This is a test build, distributed outside the Amazon Appstore. Check the file checksum before installing. The APK was built from commit `a0114068318d8ceb7502f42dbf31d6fb7d58e24c` on the `linked-login-sync` review branch, signed with the committed ChannelReel debug key. This build fixes the TV Guide preview window sticking on screen over full-screen playback. Cloud viewing sync is disabled in this APK until its HTTPS service is deployed and configured.
