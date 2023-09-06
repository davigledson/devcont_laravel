UserWindows=$(powershell.exe '$env:UserName' | tr -d '\r')
if [ -f "/mnt/c/Users/$UserWindows/.gitconfig" ]; then
    cp /mnt/c/Users/"$UserWindows"/.gitconfig ~/.gitconfig
elif [ -f "/mnt/d/Users/$UserWindows/.gitconfig" ]; then
    cp /mnt/d/Users/"$UserWindows"/.gitconfig ~/.gitconfig
else
    echo username_github
    read username
    echo email_github
    read useremail
    git config --global user.name $username
    git config --global user.email $useremail
fi

if [ -f "/mnt/c/Program Files/Git/mingw64/bin/git-credential-manager.exe" ]; then
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
elif [ -f "/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager.exe" ]; then
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
elif [ -f "/mnt/c/Program Files/Git/mingw64/bin/git-credential-manager-core.exe" ]; then
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
else
    echo "Não encontrado o git-credential-manager"
fi

cat ~/.gitconfig
