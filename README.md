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
```powershell
Invoke-RestMethod https://raw.githubusercontent.com/teylorrt/dotposh/refs/heads/main/install-winget.ps1 | Invoke-Expression
```
#### PowerShell 7 (pwsh)
```powershell
Invoke-RestMethod https://raw.githubusercontent.com/teylorrt/dotposh/refs/heads/main/install-pwsh.ps1 | Invoke-Expression
```

### Step 2: Install oh-my-posh
- Start a new PowerShell (pwsh) terminal. Note that PowerShell (pwsh) is different from Windows PowerShell (powershell). All differences are explained here: https://learn.microsoft.com/en-us/powershell/scripting/whats-new/differences-from-windows-powershell?view=powershell-7.5
- Execute the following script to install OhMyPosh
```powershell
Invoke-RestMethod https://raw.githubusercontent.com/teylorrt/dotposh/refs/heads/main/install-oh-my-posh.ps1 | Invoke-Expression
```

### Step 3: Install Dot-Posh
- Restart you PowerShell (pwsh) terminal and then execute the following command to bootstrap Dot-Posh:
```powershell
Invoke-RestMethod https://raw.githubusercontent.com/teylorrt/dotposh/refs/heads/main/install.ps1 | Invoke-Expression
```
