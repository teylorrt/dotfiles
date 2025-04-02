$global:installFilesFolder = "$HOME\dot-posh-install"

if(!$utilsLoaded) { . "$installFilesFolder\utils.ps1" }

# configure terminal settings
. "$installFilesFolder\terminal-settings.ps1"

# install Terminal-Icons. https://github.com/devblackops/Terminal-Icons
Install-Module Terminal-Icons -Scope CurrentUser -Force

# add oh-my-posh theme
Copy-Item "$installFilesFolder\dot-posh.omp.json" -Destination $env:POSH_THEMES_PATH

Write-Host "Removing install files..."
Remove-Item -Path $installFilesFolder -Recurse -Force


## Set initialization of Dot-Posh in profile
'' | Out-File -Append -Encoding default -FilePath $profile
'# load Dot-Posh' | Out-File -Append -Encoding default -FilePath $profile
'. "$HOME\dot-posh.ps1"' | Out-File -Append -Encoding default -FilePath $profile

# reload profile
pwsh