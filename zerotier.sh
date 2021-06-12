#!/bin/sh
echo "do you use su command?(y/n)"
read sucommand
if [ $sucommand = y ]
then
    echo "I need your username to add to the sudo group, if you are agree put your password"
    echo
    su -c "sudo adduser $USER sudo"
    echo added to the sudo group
    echo
    echo
    echo "restart the PC, and then say you don't use the su command"
    echo
    echo
    read nothing
    exit
else
    if [ $sucommand = n ]
    then 
        echo OK
    else
        echo ERROR
        exit
    fi
fi

echo "this script works on Debian, Ubuntu, Linux Mint, etc. (apt)"
echo "continue?(y/n)"
read debbased
if [ $debbased = n ]
then
    echo abort
    exit
fi
sudo apt install curl git python3 python3-tk xterm
echo satisfied dependencies

xterm -e "curl -s https://install.zerotier.com | sudo bash"

echo ZeroTier installed

cd /tmp

mkdir ZeroTierInstaller

echo temporaly ZeroTierInstaller Folder created

cd ZeroTierInstaller/

git clone https://github.com/tralph3/ZeroTier-GUI

echo ZeroTier-GUI by tralph3 cloned


sudo cp ZeroTier-GUI/src/zerotier-gui /usr/bin/

cd ..
sudo rm -R ZeroTierInstaller/
echo ZeroTierInstaller Folder Removed

echo Ready!!!

echo
echo
echo
echo you can run ZeroTier with this command:
echo
echo
echo sudo zerotier-gui
echo
echo
echo now you can close this window
read nothing
exit





