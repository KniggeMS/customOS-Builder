<#
.SYNOPSIS
    customOS-Builder - Haupt-Einstiegspunkt
#>

param(
    [string]$Profile = "Minimal",
    [switch]$LTSC
)

Write-Host "=== customOS-Builder v0.3 wird gestartet ===" -ForegroundColor Cyan

# Admin-Check
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Bitte als Administrator ausführen!" -ForegroundColor Red
    exit 1
}

# Module laden
$ModulePath = "$PSScriptRoot\modules"
if (Test-Path $ModulePath) {
    Get-ChildItem -Path $ModulePath -Filter "*.psm1" | ForEach-Object {
        Import-Module $_.FullName -Force
        Write-Host "Modul geladen: $($_.Name)" -ForegroundColor Gray
    }
}

Write-Host "Profil '$Profile' wird angewendet..." -ForegroundColor Green

# CoreTweaks ausführen
Invoke-CoreTweaks -LTSC:$LTSC

Write-Host "`n=== customOS Setup abgeschlossen! ===" -ForegroundColor Cyan
Write-Host "Viel Erfolg mit deinem customOS!" -ForegroundColor Magenta