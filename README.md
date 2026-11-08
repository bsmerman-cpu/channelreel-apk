# ChannelReel for Fire TV

Public download of the Android/Fire TV test APK. This repository contains only the installable APK and its checksum; it does not contain an IPTV subscription, account credentials, or channel content.

## Current build

- Version: **2.2.34** (version code 2034)
- File: [channelreel-fire-tv-2.2.34.apk](channelreel-fire-tv-2.2.34.apk)
- Package: `tv.ember.app`
- Minimum Android API: 25 (Fire OS 6)
- SHA-256: `97094d26b2fb9f3330a890d427b875ee4e8f71213afc06af74d01fe308878fd6`

The provider address is fixed to `http://channelreeltv.xyz`. Enter your own username and password in Account; neither credential is built into this public APK. This provider uses unencrypted HTTP, so the app asks you to acknowledge that before connecting.

The existing Downloader code **9616773** still points to [channelreel-fire-tv-2.2.25.apk](channelreel-fire-tv-2.2.25.apk). That filename is retained as a stable compatibility download path and now serves the same 2.2.34 APK. Use the 2.2.34 link above for a versioned download.

Download the APK and install it using your device's normal sideloading flow. It updates an existing ChannelReel installation signed with the same test key. You must supply your own provider account in the app.

## In-app updates

Builds from 2.2.33 on check [`latest.json`](latest.json) in this repo on launch (and from **Check for updates** in Account) and offer to install a newer APK. To publish a new build and refresh everything in one step, run `./publish.sh <app-debug.apk> "release notes"` — it copies the APK to its versioned and `2.2.25` paths, rewrites `latest.json` (version, URL, SHA-256, size) and this README, then commit and push.

This is a test build, distributed outside the Amazon Appstore. Check the file checksum before installing. The APK was built from commit `630580650e1ad9bf241ed2255f0ceeab32f2c22e` on the `linked-login-sync` review branch, signed with the committed ChannelReel debug key. This build smooths remote navigation on the Home screen (moving between the Live card and the Movies/Series cards), adds automatic in-app updates (the app reads `latest.json` from this repo and offers to install a newer APK) and fixes the TV Guide preview window sticking over full-screen playback. Cloud viewing sync is disabled in this APK until its HTTPS service is deployed and configured.
