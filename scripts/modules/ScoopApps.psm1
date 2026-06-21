<#
.SYNOPSIS
    ScoopApps.psm1 - Alternative Package Manager (portabel, super für Devs)
#>

function Invoke-ScoopInstaller {
    Write-Host "=== Scoop Installation wird vorbereitet ===" -ForegroundColor Cyan

    if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
        Write-Host "Scoop wird installiert..." -ForegroundColor Yellow
        Invoke-Expression "& {$(Invoke-RestMethod -Uri 'https://get.scoop.sh')}" -ErrorAction Stop
    }

    # Grund-Buckets
    scoop bucket add main
    scoop bucket add extras

    $scoopApps = @(
        "git",
        "windows-terminal",
        "vscode",
        "7zip",
        "powershell"
    )

    foreach ($app in $scoopApps) {
        Write-Host "Installiere via Scoop: $app" -ForegroundColor Gray
        scoop install $app
    }

    Write-Host "✅ Scoop Installation abgeschlossen!" -ForegroundColor Green
}

Export-ModuleMember -Function Invoke-ScoopInstaller