
$userDotFiles = "$HOME\dotfiles\dot-posh\"
$dotPoshUtils = "$userDotFiles\utils.ps1"
$installDotPoshScript = "$userDotFiles\install-dot-posh.ps1"
$dotPoshFiles = "dotfiles\*"

if (!(Get-Item $userDotFiles -errorAction SilentlyContinue)) {
    New-Item -ItemType Directory -Path $userDotFiles -Force
}

Copy-Item -Path $dotPoshFiles -Destination $userDotFiles -Recurse

# load utils
. $dotPoshUtils

# install Dot Posh
#. $installDotPoshScript

Copy-Item "dot-posh.ps1" -Destination $HOME

# reload profile
. $PROFILE