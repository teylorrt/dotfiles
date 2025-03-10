if($commandsLoaded) {
    exit
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

$global:commandsLoaded = $true