#!/bin/sh
# "uzyangi" klaviaturasini tizimdagi klaviaturalar ro'yxatiga qo'shadi yoki olib tashlaydi.
# Ishlatish:  xkb-register.sh add      (qo'shish)
#             xkb-register.sh remove   (olib tashlash)
# Bir necha marta ishga tushirilsa ham zarari yo'q (ikki marta qo'shib qo'ymaydi).
set -e

RULES="${XKB_RULES_DIR:-/usr/share/X11/xkb/rules}"
BEGIN="<!-- yangi-uzbek-harflari BEGIN -->"
END="<!-- yangi-uzbek-harflari END -->"

# Tizimda bor .xml va .lst fayllar (bir xil faylni ikki marta tuzatmaslik uchun)
files() {
    for f in "$RULES/evdev.$1" "$RULES/base.$1"; do
        [ -e "$f" ] && readlink -f "$f"
    done | sort -u
}

add_xml() {
    f="$1"
    grep -q "yangi-uzbek-harflari BEGIN" "$f" && return 0
    tmp="$(mktemp)"
    awk -v b="$BEGIN" -v e="$END" '
        !done && /<\/layoutList>/ {
            print "    " b
            print "    <layout>"
            print "      <configItem>"
            print "        <name>uzyangi</name>"
            print "        <shortDescription>uz</shortDescription>"
            print "        <description>O&apos;zbek — yangi alifbo (Ş Ç Ö Ğ)</description>"
            print "        <languageList><iso639Id>uzb</iso639Id></languageList>"
            print "      </configItem>"
            print "    </layout>"
            print "    " e
            done = 1
        }
        { print }
    ' "$f" > "$tmp"
    cat "$tmp" > "$f"
    rm -f "$tmp"
}

remove_xml() {
    f="$1"
    grep -q "yangi-uzbek-harflari BEGIN" "$f" || return 0
    tmp="$(mktemp)"
    awk '/yangi-uzbek-harflari BEGIN/ {skip=1} !skip {print} /yangi-uzbek-harflari END/ {skip=0}' "$f" > "$tmp"
    cat "$tmp" > "$f"
    rm -f "$tmp"
}

add_lst() {
    f="$1"
    grep -q "^  uzyangi " "$f" && return 0
    tmp="$(mktemp)"
    awk '{ print } /^! layout/ && !done { print "  uzyangi         O'"'"'zbek — yangi alifbo (Ş Ç Ö Ğ)"; done=1 }' "$f" > "$tmp"
    cat "$tmp" > "$f"
    rm -f "$tmp"
}

remove_lst() {
    f="$1"
    grep -q "^  uzyangi " "$f" || return 0
    tmp="$(mktemp)"
    grep -v "^  uzyangi " "$f" > "$tmp" || true
    cat "$tmp" > "$f"
    rm -f "$tmp"
}

case "$1" in
    add)
        # Avval eski yozuvni olib tashlaymiz (yangilanishda nom yangilanishi uchun)
        for f in $(files xml); do remove_xml "$f"; add_xml "$f"; done
        for f in $(files lst); do remove_lst "$f"; add_lst "$f"; done
        ;;
    remove)
        for f in $(files xml); do remove_xml "$f"; done
        for f in $(files lst); do remove_lst "$f"; done
        ;;
    *)
        echo "Ishlatish: $0 add|remove" >&2
        exit 1
        ;;
esac
