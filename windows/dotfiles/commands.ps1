if($commandsLoaded) {
    exit
}

function global:checkCommand {
    param($commandName)

    (Get-Command $commandName -errorAction SilentlyContinue)
}

function global:invokeExpression {
    param ($command)
    $command | Invoke-Expression
}

function global:setAlias { 
    param (
        [Parameter(Mandatory=$true)]
        [String]$alias, 
        [Parameter(Mandatory=$true)]
        [String]$command,
        [String]$p,
        [String]$pname
    )

    if($p -eq "-p") {
        $parameterName = "parameter"

        if($pname -ne "") {
            $parameterName = $pname
        }

        $parameter = 'param ([Parameter(Mandatory=$true)][String]$_PNAME_) _COMMAND_ $_PNAME_'
        $parameter = $parameter.Replace("_PNAME_", $parameterName)
        $command = $parameter.Replace("_COMMAND_", $command);
    }
    
    $funcName = "$alias";
    $func = 'function global:_NAME_ { _COMMAND_ }'
    $func = $func.Replace("_NAME_", $funcName)
    $func = $func.Replace("_COMMAND_", $command)

    invokeExpression($func);
}

function global:gitCommitAndPush {
    param (
        [Parameter(Mandatory=$true)]
        [string]$message
    )

    # Check if the current directory is a Git repository
    if (-not (Test-Path ".git")) {
        Write-Host "Error: Current directory is not a Git repository." -ForegroundColor Red
        return
    }

    git add -A
    git commit -m $message
    git push
}

$global:commandsLoaded = $true