# ChannelReel for Fire TV

Public download of the Android/Fire TV test APK. This repository contains only the installable APK and its checksum; it does not contain an IPTV subscription, account credentials, or channel content.

## Current build

- Version: **2.2.49** (version code 2049)
- File: [channelreel-fire-tv-2.2.49.apk](channelreel-fire-tv-2.2.49.apk)
- Package: `tv.ember.app`
- Minimum Android API: 25 (Fire OS 6)
- SHA-256: `43240045c4df4fe15ee757a776c89a9d41c87ea1219a170b62e4f54c26d6026b`

The provider address is fixed to `http://channelreeltv.xyz`. Enter your own username and password in Account; neither credential is built into this public APK. This provider uses unencrypted HTTP.

The existing Downloader code **9616773** still points to [channelreel-fire-tv-2.2.25.apk](channelreel-fire-tv-2.2.25.apk). That filename is retained as a stable compatibility download path and always serves the current APK. Use the 2.2.49 link above for a versioned download.

Download the APK and install it using your device's normal sideloading flow. It updates an existing ChannelReel installation signed with the same test key. You must supply your own provider account in the app.

## In-app updates

Builds from 2.2.33 on check [`latest.json`](latest.json) in this repo on launch (and from **Check for updates** in Account) and offer to install a newer APK. Publishing is automatic: every push to the `linked-login-sync` branch of the source repo that touches the app builds, tests and publishes the APK here under its versioned name and the `2.2.25` path, and rewrites `latest.json` (version, URL, SHA-256, size, notes). Do not add APKs or edit `latest.json` by hand; `publish.sh` is the old manual route.

Note: the files named 2.2.41–2.2.48 are stamped 2.2.1–2.2.8 inside (a numbering fault fixed in 2.2.49), so a TV on one of those keeps offering an update until it installs 2.2.49 or later.

This is a test build, distributed outside the Amazon Appstore. Check the file checksum before installing. The APK was built from commit `e54220b` on the `linked-login-sync` branch, signed with the committed ChannelReel debug key. This build adds the review fixes: smoother playback and channel changing, clearer sign-in and error messages, larger text, and correct update version numbers. Cloud viewing sync is disabled in this APK until its HTTPS service is deployed and configured.
