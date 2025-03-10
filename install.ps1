
$userDotFiles = "$HOME\dotfiles\dot-posh\"

if (!(Get-Item $userDotFiles -errorAction SilentlyContinue)) {
    New-Item -ItemType Directory -Path $userDotFiles -Force
}

# copy dotfiles
Copy-Item -Path "dotfiles\*" -Destination $userDotFiles -Recurse

# load utils
. ".\install\utils.ps1"

# install Dot Posh
#. ".\install\install-dot-posh.ps1"

Copy-Item "dot-posh.ps1" -Destination $HOME

# reload profile
. $PROFILE