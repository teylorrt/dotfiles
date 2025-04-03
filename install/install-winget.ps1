# install winget - Reference: https://learn.microsoft.com/en-us/windows/package-manager/winget/
if (!(Get-Command winget -errorAction SilentlyContinue)) {
    $progressPreference = 'silentlyContinue'
    Write-Host "Installing WinGet PowerShell module from PSGallery..."
    Install-PackageProvider -Name NuGet -Force | Out-Null
    Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
    Write-Host "Using Repair-WinGetPackageManager cmdlet to bootstrap WinGet..."
    Repair-WinGetPackageManager
    Write-Host "Done."
} else {
    Write-Output "winget already installed"
}
