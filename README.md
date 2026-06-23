# customOS-Builder

**A data-secure, optimised Windows 11 framework for custom OS enthusiasts** – mit starkem Fokus auf **Datenpartition-Schutz** und einfacher Bedienung.

Perfekt für Einsteiger und Power-User.

## ✨ Kernfeatures

- **Datensichere Installation** – Partition E: bleibt 100% unangetastet
- Modulares PowerShell-Menü (sehr noob-freundlich)
- Sichere System-Tweaks (Performance, Privacy, Services)
- Automatische Programm-Installation (Winget + Scoop)
- Vollständiges Treiber-Management (Export / Import / während Installation)

## 🚀 Schnellstart

1. Windows 11 ISO herunterladen (empfohlen: LTSC oder aktuelle 24H2/25H2)
2. Bootfähigen USB-Stick mit **Rufus** erstellen
3. `templates/autounattend.xml` ins **Root** des USB-Sticks kopieren
4. Installation starten → nur C: neu aufsetzen (E: bleibt sicher)
5. Nach der ersten Anmeldung den Ordner `C:\customOS\` erstellen und alle Skripte dorthin kopieren
6. `Start-CustomOS.ps1` **als Administrator** starten

## 🛠️ Treiber-Management (wichtig!)

### Vor der Neuinstallation (empfohlen)
- Auf dem **alten System** Option **5** im Menü ausführen → Treiber werden exportiert.

### Während der Windows-Installation (kritische Treiber)
- Den exportierten Driver-Ordner auf den USB-Stick in den Ordner `Drivers` kopieren
- Die `autounattend.xml` bindet diese Treiber automatisch ein (besonders wichtig für Netzwerk, Storage, Touchpad)

### Nach der Installation
- Option **7** im Menü → Treiber automatisch importieren

## Hauptmenü

Das Tool wird über ein übersichtliches PowerShell-Menü gesteuert:

1. Komplettes Setup starten (empfohlen)  
2. Profil auswählen und anwenden  
3. Nur System-Tweaks anwenden  
4. Programme installieren (Winget)  
5. Treiber exportieren  
6. Datensicherheits-Check  
7. Treiber importieren (nach Installation)  
8. Troubleshooting / Hilfe öffnen  
9. Beenden

## 📁 Wichtige Ordner

- `scripts/` → Alle Skripte und das Hauptmenü
- `scripts/modules/` → Einzelne Funktionen (Tweaks, Winget, etc.)
- `configs/profiles/` → JSON-Profile (Minimal, Developer, LTSC)
- `Drivers/` → Lokal (wird nicht ins Repo hochgeladen)
- `templates/` → autounattend.xml

## ⚠️ Wichtige Warnungen

- **Immer ein volles Backup** machen!
- Zuerst in einer virtuellen Maschine testen
- Alle Skripte immer als Administrator ausführen
- Microsoft kann Windows-Änderungen veröffentlichen, die Tweaks beeinflussen

---

**Mitwirken** | [Issues](https://github.com/KniggeMS/customOS-Builder/issues) | Lizenz: [MIT](LICENSE)