# ZeroTierInstaller

A installer to ZeroTier on Linux, with graphic interface (thanks to [tralph3](https://github.com/tralph3/ZeroTier-GUI))

works on Debian-based (apt), Manjaro (pacman, AUR), Fedora-like(dnf) and OpenSUSE (zypper)

## Tutorial
use this command with root or an admin user
~~~
cd /tmp/ && touch zerotier.sh.remove && rm zerotier.sh* && wget https://github.com/Can202/ZeroTierInstaller/releases/download/v0.9/zerotier.sh && chmod a+x zerotier.sh* && clear && ./zerotier.sh* && rm zerotier.sh*
~~~

## Dependencies (before the script)

- wget
- sudo

## Dependencies (on script)
if you dependencies is not satisfied, install them manually
- curl
- git
- python3 (or just python on some distros)
- python3-tk (other names: python3-tkinter, tk)
- xterm
