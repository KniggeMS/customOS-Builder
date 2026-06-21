<#
.SYNOPSIS
    customOS-Builder - Haupt-Einstiegspunkt (v0.7)
#>

param(
    [string]$Profile = "Minimal",
    [switch]$LTSC
)

Write-Host "=== customOS-Builder v0.7 wird gestartet ===" -ForegroundColor Cyan

# Admin-Check
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Bitte als Administrator ausführen!" -ForegroundColor Red
    exit 1
}

# Alle Module laden
$ModulePath = "$PSScriptRoot\modules"
Get-ChildItem -Path $ModulePath -Filter "*.psm1" | ForEach-Object {
    Import-Module $_.FullName -Force -ErrorAction SilentlyContinue
    Write-Host "Modul geladen: $($_.Name)" -ForegroundColor Gray
}

# Config laden
$config = Import-DevOSConfig -ProfileName $Profile

Write-Host "Profil '$Profile' wird angewendet..." -ForegroundColor Green

# Tweaks ausführen
Invoke-CoreTweaks -LTSC:$LTSC
Invoke-PrivacyTweaks
Invoke-ServiceTweaks

# Apps
Invoke-WingetApps -Profile $Profile
# Invoke-ScoopInstaller   # Bei Bedarf manuell oder per Profil aktivieren

Write-Host "`n=== customOS Setup erfolgreich abgeschlossen! ===" -ForegroundColor Cyan
Write-Host "Dein optimiertes System ist bereit." -ForegroundColor Magenta