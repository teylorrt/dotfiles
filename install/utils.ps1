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

$global:utilsLoaded = $true