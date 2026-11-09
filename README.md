# ChannelReel for Fire TV

Public download of the Android/Fire TV test APK. This repository contains only the installable APK and its checksum; it does not contain an IPTV subscription, account credentials, or channel content.

## Current build

- Version: **2.2.47** (version code 2047)
- File: [channelreel-fire-tv-2.2.47.apk](channelreel-fire-tv-2.2.47.apk)
- Package: `tv.ember.app`
- Minimum Android API: 25 (Fire OS 6)
- SHA-256: `85905d057a6d6a23a32f3feb8f1b8714760692e0aeb355e315ffa612fbd4ae0f`

The provider address is fixed to `http://channelreeltv.xyz`. Enter your own username and password in Account; neither credential is built into this public APK. This provider uses unencrypted HTTP, so the app asks you to acknowledge that before connecting.

The existing Downloader code **9616773** still points to [channelreel-fire-tv-2.2.25.apk](channelreel-fire-tv-2.2.25.apk). That filename is retained as a stable compatibility download path and now serves the same 2.2.47 APK. Use the 2.2.47 link above for a versioned download.

Download the APK and install it using your device's normal sideloading flow. It updates an existing ChannelReel installation signed with the same test key. You must supply your own provider account in the app.

## In-app updates

Builds from 2.2.33 on check [`latest.json`](latest.json) in this repo on launch (and from **Check for updates** in Account) and offer to install a newer APK. To publish a new build and refresh everything in one step, run `./publish.sh <app-debug.apk> "release notes"` — it copies the APK to its versioned and `2.2.25` paths, rewrites `latest.json` (version, URL, SHA-256, size) and this README, then commit and push.

This is a test build, distributed outside the Amazon Appstore. Check the file checksum before installing. The APK was built from commit `eb75f7f861cf625e6377b0de4647f5b9f6d924e3` on the `linked-login-sync` review branch, signed with the committed ChannelReel debug key. This build hides foreign GANJA categories while retaining foreign sports channels. Cloud viewing sync is disabled in this APK until its HTTPS service is deployed and configured.
