<#
.SYNOPSIS
    CoreTweaks.psm1 - Zentrale Tweaks für customOS-Builder
    Sicher, idempotent und modular
#>

function Invoke-CoreTweaks {
    [CmdletBinding()]
    param(
        [switch]$LTSC
    )

    Write-Host "=== CoreTweaks werden angewendet ===" -ForegroundColor Cyan

    # =============================================
    # 1. Performance Optimierungen
    # =============================================
    Write-Host "→ Performance Optimierungen..." -ForegroundColor Yellow
    
    # SvcHost Split Threshold (weniger svchost.exe Prozesse)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 4194304 -Type DWord -Force

    # Speicherkompression deaktivieren (spart CPU, mehr RAM-Verbrauch)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisableMemoryCompression" -Value 1 -Type DWord -Force

    # =============================================
    # 2. Privacy & Telemetrie
    # =============================================
    Write-Host "→ Privacy & Telemetrie deaktivieren..." -ForegroundColor Yellow

    $privacyPaths = @(
        "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
    )

    foreach ($path in $privacyPaths) {
        if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
        Set-ItemProperty -Path $path -Name "AllowTelemetry" -Value 0 -Type DWord -Force
    }

    # Weitere gängige Privacy-Tweaks
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Value 0 -Type DWord -Force

    # =============================================
    # 3. Service Optimierungen (sicherer Whitelist-Ansatz)
    # =============================================
    Write-Host "→ Services optimieren..." -ForegroundColor Yellow

    $servicesToDisable = @(
        "DiagTrack",           # Connected User Experiences and Telemetry
        "dmwappushservice",    # WAP Push Message Routing Service
        "MicrosoftEdgeElevationService",
        "edgeupdate",
        "edgeupdatem"
    )

    foreach ($service in $servicesToDisable) {
        if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
            Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
            Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
            Write-Host "   Service deaktiviert: $service" -ForegroundColor Gray
        }
    }

    # =============================================
    # 4. LTSC-spezifische Optimierungen (optional)
    # =============================================
    if ($LTSC) {
        Write-Host "→ LTSC-spezifische Optimierungen..." -ForegroundColor Yellow
        # Hier können später weitere LTSC-spezifische Tweaks hin
    }

    Write-Host "✅ CoreTweaks erfolgreich abgeschlossen!" -ForegroundColor Green
}

# Export der Hauptfunktion
Export-ModuleMember -Function Invoke-CoreTweaks

Write-Host "CoreTweaks-Modul erfolgreich geladen." -ForegroundColor Gray