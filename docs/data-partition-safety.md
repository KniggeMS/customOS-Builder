# Datensicherheit - E: Partition schützen

Dies ist einer der wichtigsten Vorteile von **customOS-Builder**.

## Wie es funktioniert

Die `autounattend.xml` ist so konfiguriert, dass:
- `WillWipeDisk` auf `false` steht
- Die Installation **beim Partitionsmenü anhält**
- Du manuell die Partition C: auswählen kannst
- Alle anderen Partitionen (insbesondere E:) bleiben unberührt

## Empfohlene Vorgehensweise

1. Vor der Installation → Backup der wichtigen Daten (auch wenn E: normalerweise sicher ist)
2. USB-Stick booten
3. Beim Partitionsbildschirm:
   - Lösche **nur** die alte C:-Partition (falls gewünscht)
   - Erstelle neue Partition für Windows
   - **Nicht** die Datenpartition formatieren oder löschen!
4. Installation fortsetzen

## Zusätzliche Sicherheit

Spätere Versionen werden ein Post-Install-Skript enthalten, das automatisch prüft, ob die Datenpartition noch existiert und ggf. warnt.

---

**Tipp**: Teste das komplette Setup zuerst in einer virtuellen Maschine mit zwei virtuellen Festplatten.