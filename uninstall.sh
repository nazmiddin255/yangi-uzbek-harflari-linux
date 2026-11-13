#!/bin/sh
# install.sh bilan o'rnatilgan klaviaturani o'chiradi.
# Ishlatish:  sudo sh uninstall.sh
set -e
if [ "$(id -u)" -ne 0 ]; then
    echo "Iltimos, sudo bilan ishga tushiring:  sudo sh uninstall.sh"
    exit 1
fi
if [ -x /usr/share/yangi-uzbek-harflari/xkb-register.sh ]; then
    /usr/share/yangi-uzbek-harflari/xkb-register.sh remove
fi
rm -f /usr/share/X11/xkb/symbols/uzyangi
rm -rf /usr/share/yangi-uzbek-harflari
rm -f /usr/local/bin/yangi-uzbek-harflari-yoqish \
      /usr/local/share/applications/yangi-uzbek-harflari.desktop \
      /usr/local/share/icons/hicolor/scalable/apps/yangi-uzbek-harflari.svg
echo "O'chirildi. Tizimdan chiqib qayta kiring."
