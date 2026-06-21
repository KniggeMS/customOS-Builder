<#
.SYNOPSIS
    PrivacyTweaks.psm1 - Erweiterte Datenschutz-Optimierungen
#>

function Invoke-PrivacyTweaks {
    Write-Host "=== PrivacyTweaks werden angewendet ===" -ForegroundColor Cyan

    # Telemetrie & Werbung
    $paths = @(
        "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    )

    foreach ($path in $paths) {
        if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
    }

    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Value 0 -Type DWord -Force

    Write-Host "✅ PrivacyTweaks abgeschlossen" -ForegroundColor Green
}

Export-ModuleMember -Function Invoke-PrivacyTweaks