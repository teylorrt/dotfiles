if($utilsLoaded) {
    Write-Output "utils loaded"
    exit
}
Write-Output "loading utils"

function checkCommand {
    param($commandName)

    return (Get-Command $commandName -errorAction SilentlyContinue)
}

$global:utilsLoaded = $true