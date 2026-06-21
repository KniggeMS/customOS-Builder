<#
.SYNOPSIS
    customOS-Builder - Haupt-Einstiegspunkt
#>

param(
    [string]$Profile = "Minimal",
    [switch]$LTSC
)

Write-Host "=== customOS-Builder v0.5 wird gestartet ===" -ForegroundColor Cyan

# Admin Check
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Bitte als Administrator ausführen!" -ForegroundColor Red
    exit 1
}

# Alle Module laden
$ModulePath = "$PSScriptRoot\modules"
if (Test-Path $ModulePath) {
    Get-ChildItem -Path $ModulePath -Filter "*.psm1" | ForEach-Object {
        Import-Module $_.FullName -Force
        Write-Host "Modul geladen: $($_.Name)" -ForegroundColor Gray
    }
}

Write-Host "Profil '$Profile' wird angewendet..." -ForegroundColor Green

Invoke-CoreTweaks -LTSC:$LTSC
Invoke-PrivacyTweaks
Invoke-ServiceTweaks
Invoke-WingetApps -Profile $Profile

Write-Host "`n=== customOS Setup erfolgreich abgeschlossen! ===" -ForegroundColor Cyan