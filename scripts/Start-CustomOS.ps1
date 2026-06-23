<#
.SYNOPSIS
    Start-CustomOS.ps1 - Benutzerfreundliches Hauptmenü für customOS-Builder
#>

function Show-MainMenu {
    Clear-Host
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host "          customOS-Builder - Hauptmenü" -ForegroundColor Cyan
    Write-Host "=============================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Wähle eine Option:" -ForegroundColor White
    Write-Host ""

    $options = @(
        [System.Management.Automation.Host.ChoiceDescription]::new("&1. Komplettes Setup starten (empfohlen)", "Führt das komplette Setup mit aktuellem Profil aus"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&2. Profil auswählen und anwenden", "Wähle zwischen Minimal, Developer, LTSC etc."),
        [System.Management.Automation.Host.ChoiceDescription]::new("&3. Nur System-Tweaks anwenden", "Core + Privacy + Service Tweaks"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&4. Programme installieren", "Winget + optional Scoop"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&5. Treiber exportieren", "Vom aktuellen System exportieren"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&6. Datensicherheits-Check", "Prüft Partitionen"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&7. Troubleshooting / Hilfe", "Öffnet die Hilfe-Datei"),
        [System.Management.Automation.Host.ChoiceDescription]::new("&8. Beenden", "Skript verlassen")
    )

    $result = $Host.UI.PromptForChoice("Hauptmenü", "Bitte wählen:", $options, 0)

    switch ($result) {
        0 { & "$PSScriptRoot\Setup-customOS.ps1" -Profile "Minimal" }
        1 { 
            Write-Host "`nVerfügbare Profile: Minimal, Developer, LTSC" -ForegroundColor Cyan
            $profileName = Read-Host "Profil eingeben"
            & "$PSScriptRoot\Setup-customOS.ps1" -Profile $profileName
        }
        2 { 
            Write-Host "`nSystem-Tweaks werden angewendet..." -ForegroundColor Yellow
            Import-Module "$PSScriptRoot\modules\CoreTweaks.psm1" -Force
            Import-Module "$PSScriptRoot\modules\PrivacyTweaks.psm1" -Force
            Import-Module "$PSScriptRoot\modules\ServiceTweaks.psm1" -Force
            Invoke-CoreTweaks
            Invoke-PrivacyTweaks
            Invoke-ServiceTweaks
        }
        3 { 
            Import-Module "$PSScriptRoot\modules\WingetApps.psm1" -Force
            Invoke-WingetApps -Profile "Developer"
        }
        4 { & "$PSScriptRoot\01-export-drivers.ps1" }
        5 { 
            Write-Host "`nDatensicherheits-Check: Überprüfe manuell, dass Partition E: unangetastet ist." -ForegroundColor Magenta
        }
        6 { 
            Start-Process notepad "$PSScriptRoot\..\docs\troubleshooting.md"
        }
        7 { 
            Write-Host "Auf Wiedersehen! Viel Erfolg mit deinem customOS." -ForegroundColor Cyan
            exit
        }
    }
}

# Haupt-Loop
do {
    Show-MainMenu
    if ($result -ne 7) {
        Write-Host "`nDrücke eine beliebige Taste, um zum Menü zurückzukehren..." -ForegroundColor Gray
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
} while ($result -ne 7)