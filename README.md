# Dot-Posh
Dot-Posh is a powerful collection of powershell scripts to improve productivity when using Windows Terminal.

## Requirements
- PowerShell 7
## Install

### Step 1: Install pwsh (PowerShell 7). Reference: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5
```powershell
winget install --id Microsoft.PowerShell --source winget
```

### Step 2: Make sure you may execute PowerShell scripts
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Step 3: Execute install script
```powershell
Invoke-RestMethod https://raw.githubusercontent.com/teylorrt/dotfiles/refs/heads/main/install.ps1 | Invoke-Expression
```
