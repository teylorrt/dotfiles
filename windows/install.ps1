
$installFilesFolder = "$HOME\teylor-dotfiles-install"
$userDotFiles = "$HOME\dotfiles"
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
    # Download files
    Write-Host "Downloading $path files..."
    foreach ($fileName in $files) {
        $uri = "$baseUri/$path/$fileName.$extension"
        Invoke-WebRequest -Uri $uri -OutFile $destinationFolder -UseBasicParsing
        Write-Host "Downloaded $uri"
    }
}

[string[]]$foldersToEnsure = @(
    $userDotFiles, 
    $installFilesFolder, 
    $ohMyPoshThemesFolder
)


# ensure folders
foreach ($folder in $foldersToEnsure) {
    ensureFolder $folder
}

### Download install files ###
[string[]]$installFiles = @(
    "install-dotfiles", 
    "install-font", 
    "install-node-yarn",
    "terminal-settings",
    "utils"
)
downloadFiles "windows/install" $installFiles $installFilesFolder

### Download dotfiles ###
[string[]]$dotfiles = @(
    "aliases", 
    "commands", 
    "environment",
    "git-config"
)
downloadFiles "windows/dotfiles" $dotfiles $userDotFiles

### Download oh-my-posh themes ###
[string[]]$ohMyPoshThemesFiles = @(
    "default.omp"
)
downloadFiles "windows/oh-my-posh/themes" $ohMyPoshThemesFiles $ohMyPoshThemesFolder "json"

### Download dotfiles-load.ps1 ###
downloadFiles "windows" "dotfiles-load" $HOME

# load utils
. "$installFilesFolder\utils.ps1"

# install Dotfiles
#. "$installFilesFolder\install-dotfiles.ps1"


Write-Host "Removing install files..."
Remove-Item -Path $installFolder -Recurse -Force

# reload profile
. $PROFILE