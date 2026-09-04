#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RES="$ROOT/android/app/src/main/res"
for density in mdpi hdpi xhdpi xxhdpi xxxhdpi; do
  mkdir -p "$RES/mipmap-$density"
done
cp "$ROOT/public/icon-1024.png" "$RES/mipmap-mdpi/ic_launcher.png"
cp "$ROOT/public/icon-192.png"  "$RES/mipmap-hdpi/ic_launcher.png"
cp "$ROOT/public/icon-192.png"  "$RES/mipmap-xhdpi/ic_launcher.png"
cp "$ROOT/public/icon-512.png"  "$RES/mipmap-xxhdpi/ic_launcher.png"
cp "$ROOT/public/icon-1024.png" "$RES/mipmap-xxxhdpi/ic_launcher.png"
# Round icon uses the same artwork; Android can mask it.
for density in mdpi hdpi xhdpi xxhdpi xxxhdpi; do
  cp "$RES/mipmap-$density/ic_launcher.png" "$RES/mipmap-$density/ic_launcher_round.png"
done
# Ensure the app uses the custom icon even if the generated template changes its default resources.
mkdir -p "$RES/values"
cat > "$RES/values/strings.xml" <<'XML'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Ultimate Sentence Repeater</string>
</resources>
XML
