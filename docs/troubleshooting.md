# Troubleshooting - customOS-Builder

Häufige Probleme und Lösungen.

## Allgemein

**Problem:** Skript wird nicht als Administrator ausgeführt  
**Lösung:** Rechtsklick auf PowerShell → "Als Administrator ausführen"

**Problem:** Execution Policy Fehler  
**Lösung:** 
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

autounattend.xml Probleme
Problem: Installation ignoriert die XML
Lösung:

Datei muss genau autounattend.xml heißen (Groß-/Kleinschreibung beachten)
Muss im Root des USB-Sticks liegen
USB-Stick mit Rufus im DD-Modus erstellen

Problem: Microsoft-Account-Zwang kommt trotzdem
Lösung: Die aktuellen Versionen von Windows 11 sind sehr stur. In späteren Versionen des Frameworks wird ein separater OOBE-Bypass-Skript kommen.
Post-Install Probleme
Problem: Setup-customOS.ps1 wird nicht automatisch gestartet
Lösung:

Nach der Installation den Ordner C:\customOS\ manuell erstellen
Alle Skripte und Module dort hinein kopieren
Skript manuell starten

Problem: Winget installiert nichts
Lösung:

Internet-Verbindung prüfen
winget --version testen
Skript mit Administrator-Rechten ausführen

Treiber & Hardware
Problem: Treiber fehlen nach Neuinstallation
Lösung: Vor der Installation 01-export-drivers.ps1 auf dem alten System ausführen und den Drivers-Ordner auf den neuen PC kopieren.
LTSC-spezifisch
Problem: Manche Apps/Features fehlen
Lösung: LTSC-Profil verwenden + Winget-Apps manuell nachinstallieren.