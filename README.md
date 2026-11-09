# ChannelReel for Fire TV

Public download of the Android/Fire TV test APK. This repository contains only the installable APK and its checksum; it does not contain an IPTV subscription, account credentials, or channel content.

## Current build

- Version: **2.2.43** (version code 2043)
- File: [channelreel-fire-tv-2.2.43.apk](channelreel-fire-tv-2.2.43.apk)
- Package: `tv.ember.app`
- Minimum Android API: 25 (Fire OS 6)
- SHA-256: `57fef41e9fe8214fff4a9cb1678f6ee5c10fdb29ba0c91e200dbad33740d9abd`

The provider address is fixed to `http://channelreeltv.xyz`. Enter your own username and password in Account; neither credential is built into this public APK. This provider uses unencrypted HTTP, so the app asks you to acknowledge that before connecting.

The existing Downloader code **9616773** still points to [channelreel-fire-tv-2.2.25.apk](channelreel-fire-tv-2.2.25.apk). That filename is retained as a stable compatibility download path and now serves the same 2.2.43 APK. Use the 2.2.43 link above for a versioned download.

Download the APK and install it using your device's normal sideloading flow. It updates an existing ChannelReel installation signed with the same test key. You must supply your own provider account in the app.

## In-app updates

Builds from 2.2.33 on check [`latest.json`](latest.json) in this repo on launch (and from **Check for updates** in Account) and offer to install a newer APK. To publish a new build and refresh everything in one step, run `./publish.sh <app-debug.apk> "release notes"` — it copies the APK to its versioned and `2.2.25` paths, rewrites `latest.json` (version, URL, SHA-256, size) and this README, then commit and push.

This is a test build, distributed outside the Amazon Appstore. Check the file checksum before installing. The APK was built from commit `8125f464c140537d7e104ad7f7f8d2cb0385ddb0` on the `linked-login-sync` review branch, signed with the committed ChannelReel debug key. This build fixes a stray superscript digit left on some 4K/8K channel and category names (with unit tests now guarding the lineup cleanup), on top of combining duplicate channel feeds, same-channel live failover, clean movie/series titles, instant sports scores, the Movies/Series navigation fix, hidden international channels, the consolidated PPV filter, smoother Home navigation, automatic in-app updates and the TV Guide preview-window fix. Cloud viewing sync is disabled in this APK until its HTTPS service is deployed and configured.
