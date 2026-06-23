# customOS-Builder

**A data-secure, optimised Windows 11 framework for custom OS enthusiasts** – mit starkem Fokus auf **Datenpartition-Schutz** und einfacher Bedienung.

Perfekt für Noobs und Power-User gleichermaßen.

## ✨ Kernfeatures

- **Datensichere Installation** – E:-Partition bleibt 100% unangetastet
- Modulares, idempotentes PowerShell-System
- Sichere Tweaks (Performance, Privacy, Services)
- Automatische Programm-Installation (Winget + Scoop)
- **Einfaches Menü** – auch für Einsteiger geeignet

## 🚀 Schnellstart

1. Windows 11 ISO herunterladen (empfohlen: LTSC oder 24H2/25H2)
2. Bootfähigen USB-Stick mit **Rufus** erstellen
3. `templates/autounattend.xml` ins **Root** des USB-Sticks kopieren
4. Installation starten und nur C: neu aufsetzen (E: bleibt sicher)
5. Nach der ersten Anmeldung:
   - Alle Skripte nach `C:\customOS\` kopieren
   - `Start-CustomOS.ps1` **als Administrator** starten

## Hauptmenü

Das Tool wird über ein benutzerfreundliches PowerShell-Menü gesteuert:

- Komplettes Setup
- Profil auswählen
- Nur Tweaks / Programme / Treiber
- Hilfe & Troubleshooting

## 📁 Wichtige Dateien

- `Start-CustomOS.ps1` → **Einstiegspunkt** (Menü)
- `Setup-customOS.ps1` → Kern-Setup
- `scripts/modules/` → Alle Tweaks und Funktionen
- `configs/profiles/` → JSON-Profile (Minimal, Developer, LTSC)

## ⚠️ Wichtige Warnungen

- Immer **Backup** machen!
- Zuerst in einer VM testen
- Skripte immer als Administrator ausführen

---

**Mitwirken** | [Issues](https://github.com/KniggeMS/customOS-Builder/issues) | Lizenz: [MIT](LICENSE)