
$userDotFiles = "$HOME\dotfiles\dot-posh\"
$dotPoshUtils = "$userDotFiles\utils.ps1"
$dotPoshScript = "$userDotFiles\dot-posh.ps1"
$dotPoshFiles = "dotfiles\*"

if (!(Get-Item $userDotFiles -errorAction SilentlyContinue)) {
    New-Item -ItemType Directory -Path $userDotFiles -Force
}

Copy-Item -Path $dotPoshFiles -Destination $userDotFiles -Recurse

#$dotPoshScript | Invoke-Expression