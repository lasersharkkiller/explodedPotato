#Requirements
#Install-Module -Scope CurrentUser Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore -Force
#Register-SecretVault -Name LocalSecrets -ModuleName Microsoft.PowerShell.SecretStore -DefaultVault
#Set-Secret -Name 'ThreatFox_AuthKey'      -Secret 'API_Key_Here'
#Set-Secret -Name 'MalwareBazaar_AuthKey'  -Secret 'API_Key_Here'
#Set-Secret -Name 'HybridAnalysis_API_Key' -Secret 'API_Key_Here'
#Set-Secret -Name 'OTX_API_Key'            -Secret 'API_Key_Here'
#Set-Secret -Name 'VT_API_Key_1'           -Secret 'API_Key_Here'
#Set-Secret -Name 'VT_API_Key_2'           -Secret 'API_Key_Here'

Set-Location -Path $PSScriptRoot

Import-Module -Name ".\purpleTeaming\aptIocs.psm1"
Import-Module -Name ".\purpleTeaming\GetSingleVTZippedSample.psm1"
Import-Module -Name ".\purpleTeaming\GetVTDetectionsFromList.psm1"
Import-Module -Name ".\purpleTeaming\GetVTZippedSamplesFromList.psm1"
Import-Module -Name ".\purpleTeaming\GetFreeSamplesFromList.psm1"
Import-Module -Name ".\purpleTeaming\GetMalwareBazaarByTag.psm1"
Import-Module -Name ".\purpleTeaming\PrepListofVTSamplesBasedOnAPTsAndMalwareFamilies.psm1"
Import-Module -Name ".\purpleTeaming\massMalwareDetonation.psm1"
Import-Module -Name ".\purpleTeaming\LOLDriverCertAudit.psm1"

Write-Host ""
Write-Host "  $([char]27)[4m+----------------------------------------------------------+$([char]27)[24m" -ForegroundColor Magenta
Write-Host "  $([char]27)[4m|  Exploded Potato - APT/Malware Emulation & Detonation    |$([char]27)[24m" -ForegroundColor Magenta
Write-Host "  $([char]27)[4m+----------------------------------------------------------+$([char]27)[24m" -ForegroundColor Magenta
Write-Host "1a) Pull a Single SHA256 from VT" -ForegroundColor Magenta
Write-Host "1b) Pull Detections from VT from a List" -ForegroundColor Magenta
Write-Host "1c) Pull APT IOCs Update (ThreatFox / MalwareBazaar / OTX / VT Intel)" -ForegroundColor Magenta
Write-Host "1d) Prepare a List of Hashes to be DLd Based on APT(s) and-or Malware Families" -ForegroundColor Magenta
Write-Host "1e) Pull Samples from VT from a List (requires license)" -ForegroundColor Magenta
Write-Host "1f) Pull Samples Free (MalwareBazaar -> Hybrid Analysis fallback)" -ForegroundColor Magenta
Write-Host "1g) Pull Malware Samples from MalwareBazaar by Tag" -ForegroundColor Magenta
Write-Host "1h) Mass Malware Detonation" -ForegroundColor Magenta
Write-Host "1i) LOL Driver Certificate Audit  (expired/revoked cert gap pen test)" -ForegroundColor Magenta
Write-Host ""

$functionChoice = (Read-Host "Enter an option").Trim().ToLowerInvariant()

if     ($functionChoice -eq "1a") { Get-SingleVTZippedSample }
elseif ($functionChoice -eq "1b") { Get-VTDetectionsFromList }
elseif ($functionChoice -eq "1c") { Get-ThreatActorIOCs }
elseif ($functionChoice -eq "1d") { Get-ListofVTSamplesBasedOnAPTsAndMalwareFamilies }
elseif ($functionChoice -eq "1e") { Get-VTZippedSamplesFromList }
elseif ($functionChoice -eq "1f") { Get-FreeSamplesFromList }
elseif ($functionChoice -eq "1g") { Get-MalwareBazaarByTag }
elseif ($functionChoice -eq "1h") { Invoke-MalwareDetonation }
elseif ($functionChoice -eq "1i") { Invoke-LOLDriverAudit }
else { Write-Host "Unknown option: $functionChoice" -ForegroundColor Red }
