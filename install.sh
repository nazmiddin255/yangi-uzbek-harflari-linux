#!/bin/sh
# Ubuntu/Debian bo'lmagan Linux'lar uchun o'rnatish (Fedora, Arch, openSUSE ...).
# Ubuntu/Debian/Mint'da .deb faylni ishlatish qulayroq.
# Ishlatish:  sudo sh install.sh
set -e
cd "$(dirname "$0")"

if [ "$(id -u)" -ne 0 ]; then
    echo "Iltimos, sudo bilan ishga tushiring:  sudo sh install.sh"
    exit 1
fi

XKB=/usr/share/X11/xkb
if [ ! -d "$XKB/symbols" ]; then
    echo "Xato: $XKB papkasi topilmadi. Bu Linux'da XKB boshqa joyda bo'lishi mumkin."
    exit 1
fi

install -m 644 xkb/symbols/uzyangi "$XKB/symbols/uzyangi"
install -d /usr/share/yangi-uzbek-harflari
install -m 755 scripts/xkb-register.sh /usr/share/yangi-uzbek-harflari/xkb-register.sh
/usr/share/yangi-uzbek-harflari/xkb-register.sh add
install -m 755 scripts/yangi-uzbek-harflari-yoqish /usr/local/bin/yangi-uzbek-harflari-yoqish
install -d /usr/local/share/applications /usr/local/share/icons/hicolor/scalable/apps
install -m 644 desktop/yangi-uzbek-harflari.desktop /usr/local/share/applications/
install -m 644 assets/yangi-uzbek-harflari.svg /usr/local/share/icons/hicolor/scalable/apps/

echo ""
echo "Tayyor! Endi tizimdan chiqib qayta kiring (log out / log in),"
echo "keyin ilovalar menyusidan \"Yangi o'zbek harflari\" ikonkasini bosing."
echo ""
echo "Eslatma: tizim yangilanishidan keyin klaviatura ro'yxatdan yo'qolsa,"
echo "shu skriptni qaytadan ishga tushiring."
