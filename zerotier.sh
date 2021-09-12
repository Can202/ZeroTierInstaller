#!/bin/bash



if [ ! $(whoami) = "root" ]
then
    if [ -f "/usr/bin/dialog" ] || [ -f "/usr/sbin/dialog" ] || [ -f "/usr/games/dialog" ]
    then
        dialog --title "root" --msgbox "You need run this script as root" 0 0
    else
        echo "You need run this script as root"
    fi
    clear
    exit
fi
if [ -f "/usr/bin/sudo" ] || [ -f "/usr/sbin/sudo" ] || [ -f "/usr/games/sudo" ]
then
    echo sudo
fi
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

echo "you can install just GUI (if you have zerotier-one from snap)"
echo "Do you want to install zerotier-one? y/n"
read install


if [ -f "/usr/bin/apt" ] || [ -f "/usr/sbin/apt" ] || [ -f "/usr/games/apt" ]
then
    echo apt detected
    apt update
    apt install curl git python3 python3-tk xterm
    xterm -e "curl -s https://install.zerotier.com | sudo bash"
else
    if [ -f "/usr/bin/dnf" ] || [ -f "/usr/sbin/dnf" ] || [ -f "/usr/games/dnf" ]
    then
        echo dnf detected
        dnf install curl git python3 python3-tkinter xterm
        xterm -e "curl -s https://install.zerotier.com | sudo bash"
    else
        if [ -f "/usr/bin/pacman" ] || [ -f "/usr/sbin/pacman" ] || [ -f "/usr/games/pacman" ]
        then
            echo pacman detected
            echo "WARNING: This script just works on Manjaro, no arch (Ctrl + C to cancel)"
            read
            pacman -Syy
            pacman -S zerotier-one
            pacman -S curl git python tk xterm
        else
            if [ -f "/usr/bin/zypper" ] || [ -f "/usr/sbin/zypper" ] || [ -f "/usr/games/zypper" ]
            then
                echo zypper detected
                echo "WARNING: This script just works on OpenSuse Tumbleweed, (Ctrl + C to cancel)"
                read
                zypper addrepo https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Tumbleweed/home:Dead_Mozay.repo
                zypper refresh
                zypper install ZeroTierOne
                zypper install curl git xterm python3 python3-tk
            fi
        fi
    fi
fi


              #      echo "Do you use OpenSUSE Leap 15.3 (Leap 15.3, zypper), y/n"
             #       read zypper
            #        if [ $zypper = y ]
           #         then
          #              if [ $install = y ]
         #               then
        #                    sudo zypper addrepo https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Leap_15.3/home:Dead_Mozay.repo
       #                     sudo zypper refresh
      #                      sudo zypper install ZeroTierOne
     #                   fi
    #                    sudo zypper install curl git xterm python3 python3-tk
   #                     echo satisfied dependencies
  #                      NOINSTALLONCURL="yes"

echo ZeroTier installed

cd /opt
mkdir -p ZeroTierInstaller

cd /tmp

mkdir -p ZeroTierInstaller

echo temporaly ZeroTierInstaller Folder created

cd ZeroTierInstaller/

git clone https://github.com/tralph3/ZeroTier-GUI

echo ZeroTier-GUI by tralph3 cloned


cp ZeroTier-GUI/src/zerotier-gui /usr/bin/

git clone https://github.com/Can202/ZeroTierInstaller
cd ZeroTierInstaller/
git checkout dev
cd media/
cp zerotier-gui.png /opt/ZeroTierInstaller/
chmod a+x zerotier-exec
cp zerotier-exec /opt/ZeroTierInstaller/

echo icon... done

cp zerotier-gui.desktop /usr/share/applications/
cp zerotier-gui-sudo.desktop /usr/share/applications/
cp zerotier-gui-su.desktop /usr/share/applications/

echo app created

cd /tmp
rm -vrf ZeroTierInstaller/
echo ZeroTierInstaller Folder Removed

echo Ready!!!

echo
echo
echo
echo you can run ZeroTier
echo
echo
echo Search it in your apps menu
echo
echo

echo

echo now you can close this window
exit





