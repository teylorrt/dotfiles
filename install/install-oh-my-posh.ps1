##### Install Oh My Posh #### - Reference: https://ohmyposh.dev/docs/installation/windows
# install using winget
if (!(Get-Command oh-my-posh -errorAction SilentlyContinue)) {
    Write-Output "Installing oh-my-posh"
    winget install JanDeDobbeleer.OhMyPosh -s winget

    # set bin to PATH
    $env:Path += ";$($HOME)\AppData\Local\Programs\oh-my-posh\bin"
} else {
    Write-Output "oh-my-posh already installed"
}