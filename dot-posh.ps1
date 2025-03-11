$global:DOT_POSH_FILES = "$HOME\dotfiles\dot-posh\"
$global:DOT_POSH = "$HOME\dot-posh.ps1"

# load utils
. "$DOT_POSH_FILES\commands.ps1"

# load aliases
. "$DOT_POSH_FILES\aliases.ps1"

# init oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\half-life.omp.json" | Invoke-Expression

# init fnm
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# Import PowerShell plugins
Import-Module "Terminal-Icons"
Import-Module PSReadLine

### Enable command history ###
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord "Tab" -Function HistorySearchForward 

