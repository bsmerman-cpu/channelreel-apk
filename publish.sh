#!/usr/bin/env bash
# Publish a ChannelReel Fire TV build to this repo and refresh the self-update manifest.
#
# Usage:   ./publish.sh <path-to-app-debug.apk> ["release notes shown in the app"]
#
# It copies the APK to its versioned filename AND to the fixed
# channelreel-fire-tv-2.2.25.apk path that Downloader code 9616773 serves, then
# writes latest.json (what the in-app updater reads) and updates the README.
# Review the changes, then: git add -A && git commit && git push origin main
set -euo pipefail

APK="${1:?Usage: ./publish.sh <app-debug.apk> [notes]}"
NOTES="${2:-}"
[ -f "$APK" ] || { echo "No such APK: $APK" >&2; exit 1; }

REPO="$(cd "$(dirname "$0")" && pwd)"
COMPAT="channelreel-fire-tv-2.2.25.apk"   # stable path wired to Downloader code 9616773
RAW="https://raw.githubusercontent.com/bsmerman-cpu/channelreel-apk/main"

# Find aapt from the sibling ember-tv Android SDK (override with AAPT=/path/to/aapt).
AAPT="${AAPT:-$(ls "$REPO"/../ember-tv/.tools/android-sdk/build-tools/*/aapt 2>/dev/null | head -1 || true)}"
[ -n "$AAPT" ] && [ -x "$AAPT" ] || { echo "aapt not found; set AAPT=/path/to/aapt" >&2; exit 1; }

BADGING="$("$AAPT" dump badging "$APK")"
VNAME="$(sed -n "s/.*versionName='\([^']*\)'.*/\1/p" <<<"$BADGING")"
VCODE="$(sed -n "s/.*versionCode='\([^']*\)'.*/\1/p" <<<"$BADGING")"
[ -n "$VNAME" ] && [ -n "$VCODE" ] || { echo "Could not read version from APK." >&2; exit 1; }

VERSIONED="channelreel-fire-tv-${VNAME}.apk"
cp -f "$APK" "$REPO/$VERSIONED"
cp -f "$APK" "$REPO/$COMPAT"

SHA="$(sha256sum "$REPO/$VERSIONED" | cut -d' ' -f1)"
SIZE="$(stat -c '%s' "$REPO/$VERSIONED")"

cat > "$REPO/latest.json" <<JSON
{
  "versionCode": ${VCODE},
  "versionName": "${VNAME}",
  "apkUrl": "${RAW}/${VERSIONED}",
  "sha256": "${SHA}",
  "size": ${SIZE},
  "notes": "${NOTES//\"/\\\"}"
}
JSON

# Best-effort README refresh (latest.json is the source of truth for the updater).
README="$REPO/README.md"
if [ -f "$README" ]; then
  sed -i -E \
    -e "s/^- Version: \*\*[^*]*\*\* \(version code [0-9]+\)/- Version: **${VNAME}** (version code ${VCODE})/" \
    -e "s|^- File: \[channelreel-fire-tv-[^]]*\]\(channelreel-fire-tv-[^)]*\)|- File: [${VERSIONED}](${VERSIONED})|" \
    -e "s/^- SHA-256: \`[0-9a-f]*\`/- SHA-256: \`${SHA}\`/" \
    -e "s/now serves the same [0-9.]* APK/now serves the same ${VNAME} APK/" \
    -e "s/Use the [0-9.]* link above/Use the ${VNAME} link above/" \
    "$README"
fi

echo "Published ${VNAME} (code ${VCODE})"
echo "  versioned : $VERSIONED"
echo "  downloader: $COMPAT (code 9616773)"
echo "  sha256    : $SHA"
echo "  size      : $SIZE bytes"
echo
echo "Next:  git add -A && git commit -m \"Publish Fire TV ${VNAME}\" && git push origin main"
