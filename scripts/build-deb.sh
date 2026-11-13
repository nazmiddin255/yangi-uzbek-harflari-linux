#!/bin/sh
# .deb paketini yig'adi.  Ishlatish:  sh scripts/build-deb.sh 1.0.0
set -e
VERSION="${1:?Versiya kerak, masalan: sh scripts/build-deb.sh 1.0.0}"
OUT="build/yangi-uzbek-harflari.deb"
ROOT="build/pkg"

rm -rf build && mkdir -p "$ROOT/DEBIAN" \
    "$ROOT/usr/share/X11/xkb/symbols" \
    "$ROOT/usr/share/yangi-uzbek-harflari" \
    "$ROOT/usr/share/doc/yangi-uzbek-harflari" \
    "$ROOT/usr/bin" \
    "$ROOT/usr/share/applications" \
    "$ROOT/usr/share/icons/hicolor/scalable/apps"

sed "s/@VERSION@/$VERSION/" packaging/DEBIAN/control > "$ROOT/DEBIAN/control"
install -m 644 packaging/DEBIAN/triggers "$ROOT/DEBIAN/triggers"
install -m 755 packaging/DEBIAN/postinst packaging/DEBIAN/prerm "$ROOT/DEBIAN/"
install -m 644 xkb/symbols/uzyangi "$ROOT/usr/share/X11/xkb/symbols/uzyangi"
install -m 755 scripts/xkb-register.sh "$ROOT/usr/share/yangi-uzbek-harflari/xkb-register.sh"
install -m 755 scripts/yangi-uzbek-harflari-yoqish "$ROOT/usr/bin/yangi-uzbek-harflari-yoqish"
install -m 644 desktop/yangi-uzbek-harflari.desktop "$ROOT/usr/share/applications/yangi-uzbek-harflari.desktop"
install -m 644 assets/yangi-uzbek-harflari.svg "$ROOT/usr/share/icons/hicolor/scalable/apps/yangi-uzbek-harflari.svg"
install -m 644 LICENSE "$ROOT/usr/share/doc/yangi-uzbek-harflari/copyright"

dpkg-deb --root-owner-group --build "$ROOT" "$OUT"
echo "Tayyor: $OUT"
