## reference: https://github.com/Schniz/fnm
if(!$utilsLoaded) { ./utils.ps1 }

if(!(checkCommand("fnm"))) {
    Write-Output "Installing fnm"
    winget install Schniz.fnm
    fnm completions --shell powershell

    '' | Out-File -Append -Encoding default -FilePath $profile
    'fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression' | Out-File -Append -Encoding default -FilePath $profile
}

if(!(checkCommand("node"))) {
    $nodeVersion = Read-Host "Install node version"
    fnm install $nodeVersion
    fnm use $nodeVersion
}

if(!(checkCommand("yarn"))) {
    $installYarn = Read-Host "Do you want install yarn? (y/n)"

    if($installYarn -eq "y") {
        npm install yarn
    }
}