
$userDotFiles = "$HOME\dotfiles"
$ohMyPoshFolder = "oh-my-posh"

if (!(Get-Item $userDotFiles -errorAction SilentlyContinue)) {
    New-Item -ItemType Directory -Path $userDotFiles -Force
}

# copy dotfiles
Copy-Item -Path "dotfiles\*" -Destination $userDotFiles -Recurse

# copy oh-my-posh files
Copy-Item -Path "$ohMyPoshFolder\*" -Destination "$HOME\$ohMyPoshFolder" -Recurse

# load utils
. ".\install\utils.ps1"

# install Dotfiles
#. ".\install\install-dotfiles.ps1"

Copy-Item "dotfiles-load.ps1" -Destination $HOME

# reload profile
. $PROFILE