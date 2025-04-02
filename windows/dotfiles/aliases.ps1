### This file contains a collection of aliases for various commands and functions ###
# It is designed to be used in a PowerShell environment, specifically for Windows.
# The aliases are defined using the `setAlias` function, which is a custom function defined in commands.ps1
# The aliases are intended to simplify command usage and improve productivity by providing shorter or more convenient alternatives to commonly used commands.
# For commands with parameters, the `-p` option is used to indicate that the command requires a parameter.
## Note: you can variables defined in the environment.ps1 file
# example: 
# setAlias "gis" "git status"
# setAlias "dev" "cd $DEV"
# setAlias "gic" "git checkout" "-p" -> alias with parameter. usage: gic <branch_name>

# git aliases
setAlias "gis" "git status"
setAlias "gip" "git pull"
setAlias "gipp" "git push"
setAlias "gippf" "git push --force"
setAlias "gic" "git checkout" "-p"
setAlias "main" "gic main"
setAlias "master" "gic master"
setAlias "girr" "git reset --hard"
setAlias "giaa" "git add --all"
setAlias "gicm" "gitCommitAndPush" "-p" # gitCommitAndPush is a custom function defined in commands.ps1
setAlias "gican" "git commit --amend --no-edit"
setAlias "gica" "git commit --amend"
setAlias "gif" "git fetch"

# yarn
setAlias "yas" "yarn start"
setAlias "yaf" "yarn format --end-of-line crlf"

#dev folder
setAlias "dev" "cd $DEV"