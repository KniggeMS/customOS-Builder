<#
.SYNOPSIS
    ConfigLoader.psm1 - Lädt JSON-Profile
#>

function Import-DevOSConfig {
    param(
        [string]$ProfileName = "Minimal"
    )

    $configPath = "$PSScriptRoot\..\..\configs\profiles\$ProfileName.json"
    
    if (Test-Path $configPath) {
        $config = Get-Content $configPath | ConvertFrom-Json
        Write-Host "✅ Profil geladen: $($config.Name) - $($config.Description)" -ForegroundColor Green
        return $config
    } else {
        Write-Host "⚠️ Profil '$ProfileName' nicht gefunden. Verwende Minimal." -ForegroundColor Yellow
        return $null
    }
}

Export-ModuleMember -Function Import-DevOSConfig