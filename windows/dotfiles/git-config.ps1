$name = Read-Host "Enter the name"
$email = Read-Host "Enter the e-mail"

$isGlobal = Read-Host "Do you want to configure global? (y/n)"

if($isGlobal -eq "y") {
    git config --global user.name $name
    git config --global user.email $email
    git config --global --add --bool push.autoSetupRemote true
} else {
    git config user.name $name
    git config user.email $email
    git config --add --bool push.autoSetupRemote true
}