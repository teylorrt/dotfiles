$global:installFilesFolder = "$HOME\dot-posh-install"

if(!$utilsLoaded) { . "$installFilesFolder\utils.ps1" }


$settingPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$global:terminalSettings = Get-Content -Raw $settingPath | ConvertFrom-Json

# enable copyOnSelect
$terminalSettings.copyOnSelect = $true;

# install a Nerd Font font
. "$installFilesFolder\install-font.ps1"


# update settings file
$terminalSettings | ConvertTo-Json -Depth 4 | Out-File $settingPath