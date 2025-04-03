$global:installFilesFolder = "$HOME\dot-posh-install"

if(!$utilsLoaded) { . "$installFilesFolder\utils.ps1" }

##### Install Oh My Posh #### - Reference: https://ohmyposh.dev/docs/installation/windows
# install using winget
Write-Output "Installing oh-my-posh"
if (!(checkCommand("oh-my-posh"))) {
    winget install JanDeDobbeleer.OhMyPosh -s winget

    # set bin to PATH
    $env:Path += ";$($HOME)\AppData\Local\Programs\oh-my-posh\bin"
}