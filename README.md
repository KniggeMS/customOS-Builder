# customOS-Builder

**A data-secure, optimised Windows 11 framework for custom OS enthusiasts** – with strong focus on **data partition protection** and modular setup.

Dieses Framework hilft dir, ein sauberes, performantes und datensicheres Windows 11 zu erstellen – egal ob für Entwickler, Power-User oder Custom-OS-Fans.

## ✨ Kernfeatures

- **Datensichere Installation**: C: frisch installieren, während Partition E: (oder andere Datenpartitionen) komplett unangetastet bleibt
- Modulares, idempotentes PowerShell-System
- Starkes aber sicheres Debloating + Optimierungen (auch für LTSC)
- Automatisierter Workflow mit JSON-Profilen
- Vollkommen ohne teure Tools (kein NTLite nötig)

## 🚀 Schnellstart

1. Lade die neueste Windows 11 ISO herunter (empfohlen: IoT Enterprise LTSC oder normale 24H2/25H2)
2. Erstelle einen bootfähigen USB-Stick mit **Rufus**
3. Kopiere `templates/autounattend.xml` auf den Stick ins Root-Verzeichnis
4. Starte die Installation → das Skript hält beim Partitionsmenü an
5. Nach der Installation: Führe `Setup-customOS.ps1` als Administrator aus

## 📁 Struktur

- `scripts/` → Alle PowerShell-Skripte
- `configs/profiles/` → Deine persönlichen Konfigurationen
- `templates/` → autounattend.xml und andere Vorlagen
- `docs/` → Detaillierte Anleitungen

## ⚠️ Wichtige Warnungen

- Erstelle immer ein **volles Backup** deiner Daten!
- Teste zuerst in einer VM (VirtualBox, Hyper-V oder VMware)
- Microsoft kann jederzeit Änderungen machen, die Tweaks beeinflussen

---

**Mitwirken**  
Pull Requests und Issues sind sehr willkommen!

Lizenz: MIT