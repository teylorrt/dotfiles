if($utilsLoaded) {
    Write-Output "utils loaded"
    exit
}
Write-Output "loading utils"

$global:DOT_POSH_FILES = "$HOME\dotfiles\dot-posh\"
$global:DOT_POSH = "$HOME\dot-posh.ps1"

function global:checkCommand {
    param($commandName)

    (Get-Command $commandName -errorAction SilentlyContinue)
}

function global:invokeExpression {
    param ($command)
    $command | Invoke-Expression
}

function global:setAlias { 
    param([String]$alias, [String]$command)

    $funcName = "$alias";
    $func = 'function global:_NAME_ { _COMMAND_ }'
    $func = $func.Replace("_NAME_", $funcName)
    $func = $func.Replace("_COMMAND_", $command)

    invokeExpression($func);
}

$global:utilsLoaded = $true