
$installFilesFolder = "$HOME\dot-posh-install"
$dotPoshFolder = "$HOME\dotfiles\dot-posh"
$ohMyPoshThemesFolder = "$HOME\oh-my-posh\themes"
$baseUri = "https://raw.githubusercontent.com/teylorrt/dotfiles/refs/heads/main"

function ensureFolder {
    param (
        [Parameter(Mandatory=$true)]
        [string]$folder
    )

    if (!(Get-Item $folder -errorAction SilentlyContinue)) {
        New-Item -ItemType Directory -Path $folder -Force
    }

    Write-Host "Folder $folder created successfully."
}

function downloadFile {
    param (
        [Parameter(Mandatory=$true)]
        [string]$uri,
        [Parameter(Mandatory=$true)]
        [string]$destinationFolder
    )
    
    Invoke-WebRequest -Uri $uri -OutFile $destinationFolder -UseBasicParsing
    Write-Host "Downloaded $uri"
}

function downloadFiles {
    param (
        [Parameter(Mandatory=$true)]
        [string]$path,
        [Parameter(Mandatory=$true)]
        [string[]]$files,
        [Parameter(Mandatory=$true)]
        [string]$destinationFolder,
        [string]$extension = "ps1"
    )

    Write-Host "Downloading $path files..."
    foreach ($fileName in $files) {
        $uri = "$baseUri/$path/$fileName.$extension"
        downloadFile $uri $destinationFolder
    }
}

[string[]]$foldersToEnsure = @(
    $dotPoshFolder, 
    $installFilesFolder, 
    $ohMyPoshThemesFolder
)


# ensure folders
foreach ($folder in $foldersToEnsure) {
    ensureFolder $folder
}

### Download install files ###
[string[]]$installFiles = @(
    "install-dot-posh", 
    "install-font", 
    "install-node-yarn",
    "terminal-settings",
    "utils"
)
downloadFiles "install" $installFiles $installFilesFolder

### Download dot-posh files ###
[string[]]$dotPoshFiles = @(
    "aliases", 
    "commands", 
    "environment",
    "git-config"
)
downloadFiles "dot-posh" $dotPoshFiles $dotPoshFolder

### Download oh-my-posh themes ###
[string[]]$ohMyPoshThemesFiles = @(
    "dot-posh.omp"
)
downloadFiles "oh-my-posh/themes" $ohMyPoshThemesFiles $ohMyPoshThemesFolder "json"

### Download dot-posh.ps1 ###
downloadFile "$baseUri/dot-posh.ps1" $HOME


# load utils
. "$installFilesFolder\utils.ps1"

# install Dotfiles
#. "$installFilesFolder\install-dot-posh.ps1"


Write-Host "Removing install files..."
Remove-Item -Path $installFilesFolder -Recurse -Force

# reload profile
. $PROFILE