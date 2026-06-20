# customOS-Builder

**A data-secure, optimised Windows 11 framework for custom OS enthusiasts** – mit starkem Fokus auf **Datenpartition-Schutz** und modularen Setup.

Dieses Framework hilft dir und der Community, ein sauberes, schnelles und datensicheres Windows 11 zu erstellen – ohne teure Tools.

## ✨ Kernfeatures

- **Datensichere Installation**: C: neu installieren, E: (Datenpartition) bleibt 100% unangetastet
- Modulares, idempotentes PowerShell-System (mehrmals ausführbar)
- Sicheres Debloating + Performance-Tweaks (auch für LTSC)
- JSON-Profile für verschiedene Anwendungsfälle
- Automatischer Treiber-Export & Winget-Installation

## 🚀 Schnellstart

1. Windows 11 ISO herunterladen (empfohlen: **IoT Enterprise LTSC** oder 24H2/25H2)
2. Bootfähigen USB mit **Rufus** erstellen
3. `templates/autounattend.xml` ins Root des USB-Sticks kopieren
4. Installation starten → beim Partitionsmenü C: auswählen (E: bleibt unberührt)
5. Nach erster Anmeldung `Setup-customOS.ps1` als Administrator ausführen

## 📁 Ordnerstruktur

- `scripts/` — Haupt-Skripte und Module
- `configs/profiles/` — JSON-Konfigurationen
- `templates/` — autounattend.xml
- `docs/` — Anleitungen
- `Drivers/` — Lokal (wird ignoriert)

## ⚠️ Wichtige Warnungen

- **Immer Backup machen** vor der Installation!
- Zuerst in einer VM testen
- Keine Garantie — Microsoft ändert Windows regelmäßig

---

**Mitwirken**  
Issues, Pull Requests und Feedback sind herzlich willkommen!

Lizenz: [MIT](LICENSE)