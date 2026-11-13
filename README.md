# Yangi özbek harflari — Linux

Linux uçun yangi özbek alifbosi harflari: **Ş Ç Ö Ğ**.

Oddiy inglizça klaviatura + **öng Alt (AltGr)** bilan yangi harflar yoziladi.
Fonda heç qanday dastur işlamaydi — bu oddiy klaviatura fayli.

> ⚠️ **Vaqtinçalik yeçim.** Bu şaxsiy, bepul va oçiq kodli loyiha. Rasmiy paket
> çiqqunça foydalanib turiş uçun qilingan. Kafolat berilmaydi (MIT litsenziyasi).

Windows uçun versiya: [yangi-uzbek-harflari-windows](https://github.com/nazmiddin255/yangi-uzbek-harflari-windows)

## Qanday yoziladi

| Tugmalar | Natija |
|---|---|
| AltGr + S | ş |
| AltGr + C | ç |
| AltGr + O | ö |
| AltGr + G | ğ |
| AltGr + Shift + S / C / O / G | Ş Ç Ö Ğ |
| AltGr + \` | ʼ (tutuq belgisi) |

💡 **Caps Lock** yoqilgan bölsa, AltGr + S darhol **Ş** beradi — Shift kerak emas.

Qolgan hamma tugmalar oddiy inglizça (US) klaviaturadagi kabi.

## Örnatiş

[Releases](../../releases) böllimidan kerakli faylni yuklab oling.

### Ubuntu, Debian, Linux Mint, Pop!_OS, Zorin

1. `yangi-uzbek-harflari_X.X.X_all.deb` faylini yuklab oling.
2. Terminalda:
   ```sh
   sudo apt install ./Downloads/yangi-uzbek-harflari_*_all.deb
   ```
   (yoki faylni ikki marta bosib, «Örnatiş» tugmasini bosing)

✅ Tizim yangilanganda klaviatura röyxatdan öçib ketmaydi — paket uni özi qayta tiklaydi.

### Boşqa Linux'lar (Fedora, Arch, openSUSE ...)

```sh
tar xzf yangi-uzbek-harflari-linux-*.tar.gz
cd yangi-uzbek-harflari-linux-*
sudo sh install.sh
```

⚠️ Bu usulda tizim yangilanişidan keyin klaviatura röyxatdan yöqolsa, `sudo sh install.sh` ni qaytadan işga tuşiring.

## Yoqiş

Örnatgandan keyin **tizimdan çiqib qayta kiring** (log out / log in).

**GNOME (Ubuntu, Debian, Fedora):**
Sozlamalar → Klaviatura → **+ Kiritiş manbasini qöşiş** → Özbek (Uzbek) → **O'zbek (yangi alifbo)**

**KDE Plasma:**
Tizim sozlamalari → Klaviatura → Layouts → **Add** → Uzbek → **O'zbek (yangi alifbo)**

Tillar orasida almaşiş: `Super + Space` (GNOME) yoki `Meta + Alt + K` (KDE).

## Muammolar

- **AltGr işlamayapti.** Agar Compose tugmasi öng Alt'ga qöyilgan bölsa, uni boşqa tugmaga özgartiring
  (GNOME: Tweaks → Keyboard → Compose Key).
- **Röyxatda chiqmayapti.** Tizimdan çiqib qayta kiring yoki kompyuterni qayta yoqing.
- Boşqa muammo bölsa, [Issues](../../issues) böllimiga yozing.

## Öçiriş

- Ubuntu/Debian: `sudo apt remove yangi-uzbek-harflari`
- Boşqa Linux'lar: `sudo sh uninstall.sh`

## Özgartiriş

Klaviatura bitta oddiy matn faylida: [`xkb/symbols/uzyangi`](xkb/symbols/uzyangi).
Xohlagança özgartiring va öz versiyangizni yasang.

```sh
sh scripts/build-deb.sh 1.0.0   # .deb yasaş
```

## Litsenziya

[MIT](LICENSE) — bepul, xohlagança foydalaniş va özgartiriş mumkin.
