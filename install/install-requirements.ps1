$global:installFilesFolder = "$HOME\dot-posh-install"

if(!$utilsLoaded) { . "$installFilesFolder\utils.ps1" }

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
