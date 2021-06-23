#!/bin/sh

NOINSTALLONCURL="no"

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


echo "Do you use Distros based on Debian, Ubuntu, Linux Mint, etc. (apt), y/n"
read deb
if [ $deb = y ]
then
    sudo apt install curl git python3 python3-tk xterm
    echo satisfied dependencies
else
    if [ $deb = n ]
    then
        echo "Do you use Distros based on Fedora, Red Hat, etc. (dnf), y/n"
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
                NOINSTALLONCURL="yes"
                
                if [ $install = y ]
                then
                    sudo pacman -Sy zerotier-one
                fi
                
                sudo pacman -Sy curl git python tk xterm
                echo satisfied dependencies
            else
                echo "Do you use OpenSUSE Tumbleweed (Tumbleweed repo, zypper), y/n"
                read zypper
                if [ $zypper = y ]
                then
                    if [ $install = y ]
                    then
                        sudo zypper addrepo https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Tumbleweed/home:Dead_Mozay.repo
                        sudo zypper refresh
                        sudo zypper install ZeroTierOne
                    fi
                    sudo zypper install curl git xterm python3 python3-tk
                    echo satisfied dependencies
                    NOINSTALLONCURL="yes"
                else
                    echo "Do you use OpenSUSE Leap 15.3 (Leap 15.3, zypper), y/n"
                    read zypper
                    if [ $zypper = y ]
                    then
                        if [ $install = y ]
                        then
                            sudo zypper addrepo https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Leap_15.3/home:Dead_Mozay.repo
                            sudo zypper refresh
                            sudo zypper install ZeroTierOne
                        fi
                        sudo zypper install curl git xterm python3 python3-tk
                        echo satisfied dependencies
                        NOINSTALLONCURL="yes"
                    else
                        echo "Are you an OpenSUSE user and you don't use Leap 15.3 or Tumbleweed?, y/n"
                        read zypper
                        if [ $zypper = y ]
                        then
                            echo "you have to install ZeroTier in this page"
                            echo "https://software.opensuse.org/package/ZeroTierOne"
                            echo "if you installed ZeroTierOne, press enter to continue"
                            read nothing
                            sudo zypper install curl git xterm python3 python3-tk
                            echo satisfied dependencies
                            NOINSTALLONCURL="yes"
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
            fi
        fi
    else
        echo ABORT
        exit
    fi
fi

if [ $install = y ]
then
    if [ $NOINSTALLONCURL = no ]
    then
        xterm -e "curl -s https://install.zerotier.com | sudo bash"
    fi
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
cd ZeroTierInstaller/
git checkout v0.9
cd media/
sudo cp zerotier-gui.png /opt/ZeroTierInstaller/
sudo chmod a+x zerotier-exec
sudo cp zerotier-exec /opt/ZeroTierInstaller/

echo icon... done

sudo cp zerotier-gui.desktop /usr/share/applications/
sudo cp zerotier-gui-sudo.desktop /usr/share/applications/
sudo cp zerotier-gui-su.desktop /usr/share/applications/

echo app created

cd /tmp
sudo rm -R ZeroTierInstaller/
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





