if($utilsLoaded) {
    Write-Output "utils loaded"
    exit
}
Write-Output "loading utils"

function global:checkCommand {
    param($commandName)

    (Get-Command $commandName -errorAction SilentlyContinue)
}

function global:invokeExpression {
    param ($command)
    $command | Invoke-Expression
}

## terminal settings
$global:terminalSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$global:terminalSettings = Get-Content -Raw $terminalSettingsPath | ConvertFrom-Json

$global:utilsLoaded = $true