# Dot-Posh
Dot-Posh is a powerful collection of powershell scripts to improve productivity when using Windows Terminal.

## Requirements
- winget
- PowerShell 7.x (pwsh)
## Install

### Step 0: Make sure you may execute PowerShell scripts
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Step 1: Install Requirements
#### winget
- Check if you have winget:
```powershell
winget -v
```
-  If not, install using the following script as Administrator. Reference: https://learn.microsoft.com/en-us/windows/package-manager/winget/
```powershell
    $progressPreference = 'silentlyContinue'
    Write-Host "Installing WinGet PowerShell module from PSGallery..."
    Install-PackageProvider -Name NuGet -Force | Out-Null
    Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
    Write-Host "Using Repair-WinGetPackageManager cmdlet to bootstrap WinGet..."
    Repair-WinGetPackageManager
    Write-Host "Done."
```
#### PowerShell 7 (pwsh) - Reference: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5
- Check if you have pwsh:
```powershell
pwsh --version
```
- If not, install using the following script:
```powershell
winget install --id Microsoft.PowerShell --source winget
```

### Step 2: Install oh-my-posh
- Start a new PowerShell (pwsh) terminal. Note that PowerShell (pwsh) is different from Windows PowerShell (powershell). All differences are explained here: https://learn.microsoft.com/en-us/powershell/scripting/whats-new/differences-from-windows-powershell?view=powershell-7.5
- <img width="306" alt="image" src="https://github.com/user-attachments/assets/3945e41f-1602-4958-bb1b-89902bf54525" />

- Execute the following script to install OhMyPosh
```powershell
Invoke-RestMethod https://raw.githubusercontent.com/teylorrt/dotposh/refs/heads/main/install-oh-my-posh.ps1 | Invoke-Expression
```

### Step 3: Install Dot-Posh
- Restart you PowerShell (pwsh) terminal and then execute the following command to bootstrap Dot-Posh:
```powershell
Invoke-RestMethod https://raw.githubusercontent.com/teylorrt/dotposh/refs/heads/main/install.ps1 | Invoke-Expression
```
