$isGlobal = Read-Host "Do you want to configure global? (y/n)"

if($isGlobal -eq "y") {

    $name = Read-Host "Enter the name"
    git config --global user.name $name

    $email = Read-Host "Enter the e-mail"
    git config --global user.email $email
    
    git config --global --add --bool push.autoSetupRemote true
}