#!/bin/sh
# .deb paketini yig'adi.  Ishlatish:  sh scripts/build-deb.sh 1.0.0
set -e
VERSION="${1:?Versiya kerak, masalan: sh scripts/build-deb.sh 1.0.0}"
OUT="build/yangi-uzbek-harflari_${VERSION}_all.deb"
ROOT="build/pkg"

rm -rf build && mkdir -p "$ROOT/DEBIAN" \
    "$ROOT/usr/share/X11/xkb/symbols" \
    "$ROOT/usr/share/yangi-uzbek-harflari" \
    "$ROOT/usr/share/doc/yangi-uzbek-harflari"

sed "s/@VERSION@/$VERSION/" packaging/DEBIAN/control > "$ROOT/DEBIAN/control"
install -m 644 packaging/DEBIAN/triggers "$ROOT/DEBIAN/triggers"
install -m 755 packaging/DEBIAN/postinst packaging/DEBIAN/prerm "$ROOT/DEBIAN/"
install -m 644 xkb/symbols/uzyangi "$ROOT/usr/share/X11/xkb/symbols/uzyangi"
install -m 755 scripts/xkb-register.sh "$ROOT/usr/share/yangi-uzbek-harflari/xkb-register.sh"
install -m 644 LICENSE "$ROOT/usr/share/doc/yangi-uzbek-harflari/copyright"

dpkg-deb --root-owner-group --build "$ROOT" "$OUT"
echo "Tayyor: $OUT"
