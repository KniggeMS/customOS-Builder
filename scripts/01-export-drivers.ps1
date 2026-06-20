<#
.SYNOPSIS
    Exportiert alle installierten Treiber des aktuellen Systems
    Für customOS-Builder
#>

Write-Host "=== Treiber-Export wird gestartet ===" -ForegroundColor Cyan

$DriverPath = "$PSScriptRoot\..\Drivers\$(Get-Date -Format 'yyyy-MM-dd_HH-mm')"

if (-not (Test-Path $DriverPath)) {
    New-Item -Path $DriverPath -ItemType Directory -Force | Out-Null
}

try {
    Export-WindowsDriver -Online -Destination $DriverPath -Verbose
    Write-Host "✅ Treiber erfolgreich exportiert nach: $DriverPath" -ForegroundColor Green
    Write-Host "Du kannst diesen Ordner später beim Import verwenden." -ForegroundColor Yellow
} catch {
    Write-Host "❌ Fehler beim Export: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "Fertig." -ForegroundColor Cyan