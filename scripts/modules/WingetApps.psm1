<#
.SYNOPSIS
    WingetApps.psm1 - Automatische Installation von Anwendungen via Winget
#>

function Invoke-WingetApps {
    [CmdletBinding()]
    param(
        [string]$Profile = "Minimal"
    )

    Write-Host "=== Winget Apps Installation wird gestartet ===" -ForegroundColor Cyan

    # Prüfen ob Winget installiert ist
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "Winget nicht gefunden. Installiere Microsoft App Installer..." -ForegroundColor Yellow
        Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "$env:TEMP\winget.msixbundle"
        Add-AppxPackage -Path "$env:TEMP\winget.msixbundle"
        Start-Sleep -Seconds 3
    }

    # Profil-spezifische App-Listen (kann später aus JSON geladen werden)
    $apps = @(
        "Microsoft.PowerShell",
        "Microsoft.WindowsTerminal",
        "Git.Git",
        "Microsoft.VisualStudioCode",
        "7zip.7zip",
        "Mozilla.Firefox",
        "Google.Chrome"
    )

    if ($Profile -eq "Developer") {
        $apps += @(
            "Microsoft.VisualStudio.2022.Community",
            "Python.Python.3.12",
            "NodeJS.NodeJS",
            "Microsoft.SQLServerManagementStudio"
        )
    }

    foreach ($app in $apps) {
        Write-Host "Installiere: $app ..." -ForegroundColor Gray
        try {
            winget install --id $app --silent --accept-source-agreements --accept-package-agreements
            Write-Host "   ✅ $app installiert" -ForegroundColor Green
        } catch {
            Write-Host "   ⚠️ Fehler bei $app" -ForegroundColor Yellow
        }
    }

    Write-Host "✅ Winget Apps Installation abgeschlossen!" -ForegroundColor Green
}

Export-ModuleMember -Function Invoke-WingetApps