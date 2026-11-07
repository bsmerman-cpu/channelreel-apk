# ChannelReel for Fire TV

Public download of the Android/Fire TV test APK. This repository contains only the installable APK and its checksum; it does not contain an IPTV subscription, account credentials, or channel content.

## Current build

- Version: **2.2.26** (version code 2026)
- File: [channelreel-fire-tv-2.2.26.apk](channelreel-fire-tv-2.2.26.apk)
- Package: `tv.ember.app`
- Minimum Android API: 25 (Fire OS 6)
- SHA-256: `8ff30b9a2cb45b56b4edb27990461b207ae5c47be812164676c35f6748ce508c`

The provider address is fixed to `http://channelreeltv.xyz`. Enter your own username and password in Account; neither credential is built into this public APK. This provider uses unencrypted HTTP, so the app asks you to acknowledge that before connecting.

The existing Downloader code **9616773** still points to [channelreel-fire-tv-2.2.25.apk](channelreel-fire-tv-2.2.25.apk). That older filename is retained as a compatibility download path and now serves the same 2.2.26 APK. Use the 2.2.26 link above for a versioned download.

Download the APK and install it using your device's normal sideloading flow. It updates an existing ChannelReel installation signed with the same test key. You must supply your own provider account in the app.

This is a test build, distributed outside the Amazon Appstore. Check the file checksum before installing. The APK was built by the ChannelReel Android GitHub Actions workflow from commit `f077a5e0d46c7e4f366dce8a7e028fe7cb996cf3`.
