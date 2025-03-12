$global:DOT_FILES = "$HOME\dotfiles"
$global:DOT_FILES_LOAD = "$HOME\dotfiles-load.ps1"
$global:OH_MY_POSH_TEMES = "$HOME\oh-my-posh\themes"

# load environment
. "$DOT_FILES\environment.ps1"

# load utils
. "$DOT_FILES\commands.ps1"

# load aliases
. "$DOT_FILES\aliases.ps1"

# init oh-my-posh
oh-my-posh init pwsh --config "$OH_MY_POSH_TEMES\default.omp.json" | Invoke-Expression

# init fnm
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# Import PowerShell plugins
Import-Module "Terminal-Icons"
Import-Module PSReadLine

### Enable command history ###
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Enable "Tab" in history
# Note: Enable isso will disable command autocomplete. You can replace "Tab" with another key, but it may not be as useful as the current setting.
#Set-PSReadLineKeyHandler -Chord "Tab" -Function HistorySearchForward 
