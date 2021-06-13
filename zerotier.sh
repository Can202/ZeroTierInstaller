#!/bin/sh

PACMAN="no"

echo "do you use sudo command?(y/n)"
read sucommand
if [ $sucommand = n ]
then
    echo "I need your username to add to the sudo group, if you are agree put your password"
    echo
    su -c "sudo adduser $USER sudo"
    echo added to the sudo group
    echo
    echo
    echo "restart the PC, and then say you use the sudo command"
    echo
    echo
    read nothing
    exit
else
    if [ $sucommand = y ]
    then 
        echo OK
    else
        echo ERROR
        exit
    fi
fi

echo "Do you use Distros based on Debian, Ubuntu, Linux Mint, etc. (apt), y/n"
read deb
if [ $deb = y ]
then
    sudo apt install curl git python3 python3-tk xterm
    echo satisfied dependencies
else
    if [ $deb = n ]
    then
        echo "Do you use Distros based on Fedora, Red Hat, Mageia, etc. (dnf), y/n"
        read dnf
        if [ $dnf = y ]
        then
            sudo dnf install curl git python3 python3-tkinter xterm
            echo satisfied dependencies
        else
            echo "Do you use Distros based on Arch, Manjaro, etc (pacman), y/n"
            read pacman
            if [ $pacman = y ]
            then
                PACMAN="yes"
                sudo pacman -Sy curl git python tk xterm zerotier-one
                echo satisfied dependencies
            else
                echo "Do you use Distros based on OpenSUSE (zypper), y/n"
                read zypper
                if [ $zypper = y ]
                then
                    sudo zypper addrepo https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Tumbleweed/home:Dead_Mozay.repo
                    sudo zypper refresh
                    sudo zypper install ZeroTierOne
                    sudo zypper install curl git xterm python3 python3-tk
                    echo satisfied dependencies
                    PACMAN="yes"
                else
                    echo "do you want to continue without the satisfied dependencies?, y/n"
                    read nodep
                    if [ $nodep = n ]
                    then
                        echo ABORT
                        exit
                    fi
                fi
            fi
        fi
    else
        echo ABORT
        exit
    fi
fi

if [ $PACMAN = no ]
then
    xterm -e "curl -s https://install.zerotier.com | sudo bash"
fi

echo ZeroTier installed

cd /opt
sudo mkdir ZeroTierInstaller

cd /tmp

mkdir ZeroTierInstaller

echo temporaly ZeroTierInstaller Folder created

cd ZeroTierInstaller/

git clone https://github.com/tralph3/ZeroTier-GUI

echo ZeroTier-GUI by tralph3 cloned


sudo cp ZeroTier-GUI/src/zerotier-gui /usr/bin/

git clone https://github.com/Can202/ZeroTierInstaller
cd ZeroTierInstaller/media/
sudo cp zerotier-gui.png /opt/ZeroTierInstaller/
sudo chmod a+x zerotier-exec
sudo cp zerotier-exec /opt/ZeroTierInstaller/

echo icon... done

sudo cp zerotier-gui.desktop /usr/share/applications/
sudo cp zerotier-gui-sudo.desktop /usr/share/applications/

echo app created

cd /tmp
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

echo and in your apps

echo now you can close this window
read nothing
exit





