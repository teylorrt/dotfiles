if(!$utilsLoaded) { ./utils.ps1 }

##### Install Oh My Posh #### - Reference: https://ohmyposh.dev/docs/installation/windows
# install using winget
Write-Output "Installing oh-my-posh"
if (!(checkCommand("oh-my-posh"))) {
    winget install JanDeDobbeleer.OhMyPosh -s winget

    # set bin to PATH
    $env:Path += ";$($HOME)\AppData\Local\Programs\oh-my-posh\bin"

    Write-Host "Please restart your terminal."
    $Stopwatch = [System.Diagnostics.Stopwatch]::new()
    $Stopwatch.Start()
    
    $Counter = 6
    # correct for off-by-one
    $Threshold = 1
    while ($Counter -gt $Threshold) {
        Start-Sleep -Seconds 1
        $Counter --
        'Your terminal will automatically close in {0:D2} seconds.' -f $Counter
    }
    
    $Stopwatch.Stop()
    Stop-process -Id $PID -Force
}

$defaultTheme = "half-life"
$theme = Read-Host "oh-my-posh theme. Go to https://ohmyposh.dev/docs/themes to see themes. Default ($defaultTheme)"

if("" -eq $theme) {
    $theme = $defaultTheme
}

$initCommand = 'oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\THEME_NAME.omp.json" | Invoke-Expression';
$initCommand = $initCommand.Replace('THEME_NAME', $theme)


'' | Out-File -Append -Encoding default -FilePath $profile
$initCommand | Out-File -Append -Encoding default -FilePath $profile

# install a Nerd Font font
$installFont = Read-Host "Do you want to install a custom font? (y/n)"

if($installFont -eq "y") {
    # install font
    ./install-font.ps1
}

# configure terminal settings
./terminal-settings.ps1

# install Terminal-Icons. https://github.com/devblackops/Terminal-Icons
Install-Module Terminal-Icons -Scope AllUsers -Force