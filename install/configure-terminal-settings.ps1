$global:installFilesFolder = "$HOME\dot-posh-install"

if(!$utilsLoaded) { . "$installFilesFolder\utils.ps1" }

# configure terminal settings
. "$installFilesFolder\terminal-settings.ps1"

# install Terminal-Icons. https://github.com/devblackops/Terminal-Icons
Install-Module Terminal-Icons -Scope CurrentUser -Force

# add oh-my-posh theme
Copy-Item "$installFilesFolder\dot-posh.omp.json" -Destination $env:POSH_THEMES_PATH -Force