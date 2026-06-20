<#
.SYNOPSIS
    customOS-Builder - Haupt-Einstiegspunkt
#>

param(
    [string]$Profile = "Minimal"
)

Write-Host "=== customOS-Builder v0.2 wird gestartet ===" -ForegroundColor Cyan

# Admin-Check
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Bitte als Administrator ausführen!" -ForegroundColor Red
    exit 1
}

# Ordner für Module
$ModulePath = "$PSScriptRoot\modules"
if (Test-Path $ModulePath) {
    Get-ChildItem -Path $ModulePath -Filter "*.psm1" | ForEach-Object {
        Import-Module $_.FullName -Force
        Write-Host "Modul geladen: $($_.Name)" -ForegroundColor Gray
    }
}

Write-Host "Profil '$Profile' wird angewendet..." -ForegroundColor Green

# Beispiel-Aufrufe (später erweitert)
# Export-Drivers   # bei Bedarf manuell starten
# Apply-CoreTweaks

Write-Host "`n=== customOS Setup abgeschlossen! ===" -ForegroundColor Cyan