# Exploded Potato

APT/malware-family emulation and detonation tooling. Split out of [Loaded-Potato](../Loaded-Potato/) Group 10.

## Setup

```powershell
Install-Module -Scope CurrentUser Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore -Force
Register-SecretVault -Name LocalSecrets -ModuleName Microsoft.PowerShell.SecretStore -DefaultVault
Set-SecretStoreConfiguration -Authentication Password -Interaction Prompt -Scope CurrentUser

Set-Secret -Name 'VT_API_Key_1'           -Secret (Read-Host -AsSecureString)
Set-Secret -Name 'VT_API_Key_2'           -Secret (Read-Host -AsSecureString)
Set-Secret -Name 'ThreatFox_AuthKey'      -Secret (Read-Host -AsSecureString)
Set-Secret -Name 'MalwareBazaar_AuthKey'  -Secret (Read-Host -AsSecureString)
Set-Secret -Name 'HybridAnalysis_API_Key' -Secret (Read-Host -AsSecureString)
Set-Secret -Name 'OTX_API_Key'            -Secret (Read-Host -AsSecureString)
```

## Run

```powershell
.\ExplodedPotato_Main.ps1
```

## Menu

| Option | Function | Module |
|--------|----------|--------|
| 1a | `Get-SingleVTZippedSample` | `purpleTeaming/GetSingleVTZippedSample.psm1` |
| 1b | `Get-VTDetectionsFromList` | `purpleTeaming/GetVTDetectionsFromList.psm1` |
| 1c | `Get-ThreatActorIOCs` | `purpleTeaming/aptIocs.psm1` |
| 1d | `Get-ListofVTSamplesBasedOnAPTsAndMalwareFamilies` | `purpleTeaming/PrepListofVTSamplesBasedOnAPTsAndMalwareFamilies.psm1` |
| 1e | `Get-VTZippedSamplesFromList` | `purpleTeaming/GetVTZippedSamplesFromList.psm1` |
| 1f | `Get-FreeSamplesFromList` | `purpleTeaming/GetFreeSamplesFromList.psm1` |
| 1g | `Get-MalwareBazaarByTag` | `purpleTeaming/GetMalwareBazaarByTag.psm1` |
| 1h | `Invoke-MalwareDetonation` | `purpleTeaming/massMalwareDetonation.psm1` |
| 1i | `Invoke-LOLDriverAudit` | `purpleTeaming/LOLDriverCertAudit.psm1` |

## Known cleanup items

- `aptIocs.psm1` contains its own internal `Get-MalwareBazaarByTag` that duplicates `GetMalwareBazaarByTag.psm1`. Pre-existing from Loaded-Potato; consolidate when convenient.
