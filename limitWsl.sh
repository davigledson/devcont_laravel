UserWindows=$(powershell.exe '$env:UserName' | tr -d '\r')
if [ -d "/mnt/c/Users/$UserWindows" ]; then
    echo -e '[wsl2]\nmemory=3GB\n' > /mnt/c/Users/"$UserWindows"/.wslconfig
elif [ -d "/mnt/d/Users/$UserWindows" ]; then
    echo -e '[wsl2]\nmemory=3GB\n' > /mnt/d/Users/"$UserWindows"/.wslconfig
else
    echo "Não foi possivel limitar o WSL"
fi