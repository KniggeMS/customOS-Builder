<#
.SYNOPSIS
    ServiceTweaks.psm1 - Sichere Service-Optimierungen
#>

function Invoke-ServiceTweaks {
    Write-Host "=== ServiceTweaks werden angewendet ===" -ForegroundColor Cyan

    $disableServices = @(
        "DiagTrack", "dmwappushservice", "DPS", "SysMain", 
        "XboxGipSvc", "XblAuthManager", "XblGameSave"
    )

    foreach ($svc in $disableServices) {
        if (Get-Service -Name $svc -ErrorAction SilentlyContinue) {
            Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
            Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
            Write-Host "   Deaktiviert: $svc" -ForegroundColor Gray
        }
    }

    Write-Host "✅ ServiceTweaks abgeschlossen" -ForegroundColor Green
}
Export-ModuleMember -Function Invoke-ServiceTweaks