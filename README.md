# ZeroTierInstaller

A installer to ZeroTier on Linux, with graphic interface (thanks to [tralph3](https://github.com/tralph3/ZeroTier-GUI))

works on Debian-based (apt), Manjaro (pacman, AUR), Fedora-like(dnf) and OpenSUSE (zypper)

## Tutorial
use this command with root or an admin user
### sudo
~~~
cd /tmp/ && rm -vrf zerotier.bash && curl -LO https://raw.githubusercontent.com/Can202/ZeroTierInstaller/dev/zerotier.bash && chmod a+x zerotier.bash && clear && sudo ./zerotier.bash && rm -vrf zerotier.bash
~~~
### su
~~~
cd /tmp/ && rm -vrf zerotier.bash && curl -LO https://raw.githubusercontent.com/Can202/ZeroTierInstaller/dev/zerotier.bash && chmod a+x zerotier.bash && clear && su root -c './zerotier.bash' && rm -vrf zerotier.bash
~~~

## Dependencies (before the script)

- curl
- sudo

## Dependencies (on script)
if you dependencies is not satisfied, install them manually
- curl
- git
- python3 (or just python on some distros)
- python3-tk (other names: python3-tkinter, tk)
- xterm
