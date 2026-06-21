<#
.SYNOPSIS
    Test-Framework.ps1 - Schnelltest für customOS-Builder
#>

Write-Host "=== customOS-Builder Framework Test ===" -ForegroundColor Cyan

# Admin-Check
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "❌ Bitte als Administrator ausführen!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Administrator-Rechte OK" -ForegroundColor Green

# Module testen
$modules = @("CoreTweaks", "PrivacyTweaks", "ServiceTweaks", "WingetApps", "ConfigLoader", "ScoopApps")
foreach ($mod in $modules) {
    $path = "$PSScriptRoot\modules\$mod.psm1"
    if (Test-Path $path) {
        Write-Host "✅ Modul gefunden: $mod" -ForegroundColor Green
    } else {
        Write-Host "⚠️ Modul fehlt: $mod" -ForegroundColor Yellow
    }
}

# Config testen
$config = Import-DevOSConfig -ProfileName "Minimal"
if ($config) {
    Write-Host "✅ JSON-Config funktioniert" -ForegroundColor Green
}

Write-Host "`n=== Test abgeschlossen ===" -ForegroundColor Cyan
Write-Host "Du kannst jetzt mit 'Setup-customOS.ps1 -Profile Developer' starten." -ForegroundColor Magenta