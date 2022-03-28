#!/bin/bash
#
#repo hozzáadáása
add-apt-repository universe multiverse -y
#csomagok frissítése
apt-update -y
apt upgrade -y
##csomagok törlése
apt remove ubiquity ubiquity-casper ubiquity-slideshow-ubuntu ubiquity-ubuntu-artwork simple-scan shotwell gparted thunderbird gnome-mahjongg gnome-font-viewer gnome-startup-applications gnome-software gnome-shell-extensions gnome-characters gnome-sudoku gnome-mines gnome-calendar gnome-todo gnome-logs gnome-disk-utility gparted transmission-gtk cheese rhythmbox remmina gedit totem deja-dup aisleriot baobab language-selector-gnome update-manager software-properties-gtk desktop-icons-ng update-manager-core usb-creator-gtk update-manager seahorse libreoffice* -y	
#csomagok telepítése
apt install dialog curl pipenv git python3-tk python3-pygame language-pack-en language-pack-hu gnome-user-docs-hu language-pack-gnome-hu-base language-pack-gnome-hu python3-matplotlib libxcb-xinerama0-dev dialog xdg-user-dirs-gtk git gnome-control-center  qtwebengine5-dev libwebsockets-dev libqt5webkit5 libqt5multimediawidgets5 libqt5svg5 libqt5script5 libqt5scripttools5 libqt5sql5 libqt5texttospeech5 sudo -y
#nyelv beállítása
update-locale LANG=hu_HU.UTF-8 
#billentyűzet beállítása
sed -ie 's/"us"/"hu"/g' /etc/default/keyboard
#
#PyCharm telepítése
#https://www.how2shout.com/linux/how-to-install-pycharm-ubuntu-20-04-lts/
mkdir /opt/pycharm
tar xfz pycharm-*.tar.gz -C /opt/pycharm/
#PyCharm desktop létrehozása
cat > /usr/share/applications/pycharm.desktop << EOF 
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=PyCharm
Comment= The Python IDE for Professional Developers
Exec=/opt/pycharm/pycharm-community-2021.3.2/bin/pycharm.sh
Icon=/opt/pycharm/pycharm-community-2021.3.2/bin/pycharm.png
Terminal=false
EOF
#pip csomagok telepítése
#https://www.blog.pythonlibrary.org/2021/05/27/pyinstaller-how-to-turn-your-python-code-into-an-exe-on-windows/
pip install PyInstaller
pip install py2exe
pip install cx_freeze
pip install Nuitka
pip install Briefcase
#Google Chrome telepítése
#https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-20-04/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb -y
#
#Visual Studio Code telepítése
#https://code.visualstudio.com/docs/setup/linux
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt install apt-transport-https -y
apt update
apt install code -y
#
#Atom telepítése
apt install software-properties-common apt-transport-https wget
dpkg -i atom*
#https://flight-manual.atom.io/getting-started/sections/installing-atom/
#wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
#sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
#
#Panel ikonjainak eltüntetése
cat > /usr/share/glib-2.0/schemas/90_ubuntu-settings.gschema.override << EOF
[org.gnome.shell]
favorite-apps =[]
EOF
#
#Packet Tracer telepítése
#https://www.computernetworkingnotes.com/ccna-study-guide/download-packet-tracer-for-windows-and-linux.html
apt install xdg-utils gtk-update-icon-cache libgl1-mesa-glx libpulse0 libnss3 libxss1,libasound2 libxslt1.1 libxkbcommon-x11-0 libxcb-xinerama0-dev libfreetype6 -y
Wget https://archive.org/download/pt81_20220222/CiscoPacketTracer_811_Ubuntu_64bit.deb
dpkg -i CiscoPacketTracer_811_Ubuntu_64bit.deb
cat > /usr/share/applications/PacketTracer.desktop << EOF 
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=PacketTracer
Comment=Cisco Packet Tracer
Exec=/opt/pt/packettracer
Icon=/opt/pt/art/pkt.png
Terminal=false
EOF
#
#GitHub Desktop teleptése
wget https://github.com/shiftkey/desktop/releases/download/release-2.9.9-linux2/GitHubDesktop-linux-2.9.9-linux2.deb
dpkg -i Git*
#
# Dashban megjelenő alkalmazások elrejtése
mv /usr/share/applications/gnome-system-monitor.desktop /usr/share/applications/gnome-system-monitor.desktop.hide
mv /usr/share/applications/org.gnome.Extensions.desktop /usr/share/applications/org.gnome.Extensions.desktop.hide
mv /usr/share/applications/idle-python3.9.desktop  /usr/share/applications/idle-python3.9.desktop.hide
mv /usr/share/applications/gorg.gnome.PowerStats.desktop /usr/share/applications/org.gnome.PowerStats.desktop.hide
mv /usr/share/applications/org.gnome.Screenshot.desktop /usr/share/applications/org.gnome.Screenshot.desktop.hide
mv /usr/share/applications/nm-connection-editor.desktop /usr/share/applications/nm-connection-editor.desktop.hide
mv /usr/share/applications/org.gnome.Evince-previewer.desktop /usr/share/applications/org.gnome.Evince-previewer.desktop.hide
mv /usr/share/applications/org.gnome.eog.desktop /usr/share/applications/org.gnome.eog.desktop.hide
mv /usr/share/applications/org.gnome.Terminal.desktop /usr/share/applications/org.gnome.Terminal.desktop.hide
mv /var/lib/snapd/desktop/aplications/firefox_firefox.desktop /var/lib/snapd/desktop/aplications/firefox_firefox.desktop.hide
mv /var/lib/snapd/desktop/aplications/snap-store_snap-store.desktop /var/lib/snapd/desktop/aplications/snap-store_snap-store.desktop.hide
mv /usr/share/applications/org.gnome.FileRoller.desktop /usr/share/applications/org.gnome.FileRoller.desktop.hide
mv /usr/share/applications/yelp.desktop /usr/share/applications/yelp.desktop.hide
mv /usr/share/applications/software-properties-livepatch.desktop /usr/share/applications/software-properties-livepatch.desktop.hide
mv /usr/share/applications/software-properties-gtk.desktop /usr/share/applications/software-properties-gtk.desktop.hide
mv /usr/share/applications/org.gnome.Evince.desktop /usr/share/applications/org.gnome.Evince.desktop.hide
mv /usr/share/applications/org.gnome.PowerStats.desktop /usr/share/applications/org.gnome.PowerStats.desktop.hide
mv /usr/share/applications/software-properties-drivers.desktop /usr/share/applications/software-properties-drivers.desktop.hide
mv /var/lib/snapd/desktop/applications/snap-store_ubuntu-software.desktop /var/lib/snapd/desktop/applications/snap-store_ubuntu-software.desktop.hide
mv /usr/share/applications/gnome-language-selector.desktop/usr/share/applications/gnome-language-selector.desktop.hide
rm /etc/init/tty3.conf && rm /etc/init/tty4.conf && rm /etc/init/tty5.conf && rm /etc/init/tty6.conf
apt install language-pack-gnome-hu
#
#Telepítők eltávolítása
rm CiscoPacketTracer_811_Ubuntu_64bit.deb
rm Pycharm-c*
rm google-c*
rm atom*
rm GitHubD*
apt autoremove -y
#
