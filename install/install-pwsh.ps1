# install pwsh - Reference: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5
if (!(Get-Command pwsh -errorAction SilentlyContinue)) {
    Write-Output "Installing pwsh"
    winget install --id Microsoft.PowerShell --source winget
} else {
    Write-Output "pwsh already installed"
}
