<#
.SYNOPSIS
    customOS-Builder - Haupt-Einstiegspunkt (v0.6)
#>

param(
    [string]$Profile = "Minimal",
    [switch]$LTSC
)

Write-Host "=== customOS-Builder v0.6 wird gestartet ===" -ForegroundColor Cyan

# Admin-Check
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Bitte als Administrator ausführen!" -ForegroundColor Red
    exit 1
}

# Module laden
$ModulePath = "$PSScriptRoot\modules"
Get-ChildItem -Path $ModulePath -Filter "*.psm1" | ForEach-Object {
    Import-Module $_.FullName -Force
    Write-Host "Modul geladen: $($_.Name)" -ForegroundColor Gray
}

# JSON Config laden
$config = Import-DevOSConfig -ProfileName $Profile

Write-Host "Profil '$Profile' wird angewendet..." -ForegroundColor Green

Invoke-CoreTweaks -LTSC:$LTSC
Invoke-PrivacyTweaks
Invoke-ServiceTweaks
Invoke-WingetApps -Profile $Profile
# Invoke-ScoopInstaller  # optional, kann manuell aufgerufen werden

Write-Host "`n=== customOS Setup erfolgreich abgeschlossen! ===" -ForegroundColor Cyan