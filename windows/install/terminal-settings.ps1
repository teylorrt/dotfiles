if(!$utilsLoaded) { ./utils.ps1 }

# enable copyOnSelect
$terminalSettings.copyOnSelect = $true;

#setting title
##$Host.UI.RawUI.WindowTitle = Split-Path -Path (Get-Location) -Leaf