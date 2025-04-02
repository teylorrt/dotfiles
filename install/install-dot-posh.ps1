if(!$utilsLoaded) { ./utils.ps1 }

# install winget - Reference: https://learn.microsoft.com/en-us/windows/package-manager/winget/
if (!(checkCommand("winget"))) {
    $progressPreference = 'silentlyContinue'
    Write-Host "Installing WinGet PowerShell module from PSGallery..."
    Install-PackageProvider -Name NuGet -Force | Out-Null
    Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
    Write-Host "Using Repair-WinGetPackageManager cmdlet to bootstrap WinGet..."
    Repair-WinGetPackageManager
    Write-Host "Done."
}

# install pwsh - Reference: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5
if (!(checkCommand("pwsh"))) {
    Write-Output "Installing pwsh"
    winget install --id Microsoft.PowerShell --source winget
}

# change to pwsh
Write-Output "Starting pwsh"
pwsh

##### Install Oh My Posh #### - Reference: https://ohmyposh.dev/docs/installation/windows
# install using winget
Write-Output "Installing oh-my-posh"
if (!(checkCommand("oh-my-posh"))) {
    winget install JanDeDobbeleer.OhMyPosh -s winget

    # set bin to PATH
    $env:Path += ";$($HOME)\AppData\Local\Programs\oh-my-posh\bin"

    # restart pwsh
    pwsh
}

# configure terminal settings
. "$installFilesFolder\terminal-settings.ps1"

# install Terminal-Icons. https://github.com/devblackops/Terminal-Icons
Install-Module Terminal-Icons -Scope AllUsers -Force