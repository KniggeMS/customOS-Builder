<#
.SYNOPSIS
    WingetApps.psm1 - Automatische Installation mit guter Fehlerbehandlung
#>

function Invoke-WingetApps {
    [CmdletBinding()]
    param(
        [string]$Profile = "Minimal"
    )

    Write-Host "=== Winget Apps Installation wird gestartet ===" -ForegroundColor Cyan

    # Winget prüfen / installieren
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "Winget nicht gefunden. Versuche Installation..." -ForegroundColor Yellow
        try {
            Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "$env:TEMP\winget.msixbundle" -ErrorAction Stop
            Add-AppxPackage -Path "$env:TEMP\winget.msixbundle" -ErrorAction Stop
            Start-Sleep -Seconds 5
        } catch {
            Write-Host "❌ Winget konnte nicht automatisch installiert werden. Installiere es manuell." -ForegroundColor Red
            return
        }
    }

    $apps = @(
        "Microsoft.PowerShell",
        "Microsoft.WindowsTerminal",
        "Git.Git",
        "Microsoft.VisualStudioCode",
        "7zip.7zip"
    )

    if ($Profile -eq "Developer") {
        $apps += @("Python.Python.3.12", "OpenJS.NodeJS", "Microsoft.VisualStudio.2022.Community")
    }

    foreach ($app in $apps) {
        Write-Host "Installiere: $app ..." -ForegroundColor Gray
        try {
            $result = winget install --id $app --silent --accept-source-agreements --accept-package-agreements --force
            if ($LASTEXITCODE -eq 0 -or $result -match "already installed") {
                Write-Host "   ✅ $app erfolgreich" -ForegroundColor Green
            } else {
                Write-Host "   ⚠️ $app (bereits installiert oder Warnung)" -ForegroundColor Yellow
            }
        } catch {
            Write-Host "   ❌ Fehler bei $app: $($_.Exception.Message)" -ForegroundColor Red
        }
    }

    Write-Host "✅ Winget-Installation abgeschlossen!" -ForegroundColor Green
}

Export-ModuleMember -Function Invoke-WingetApps