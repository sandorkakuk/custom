#!/bin/bash
#
#adding repositories
add-apt-repository universe multiverse -y
#update packages
apt update -y && apt upgrade -y
#set language
dpkg-reconfigure locales && update-locale LANG=hu_HU.UTF-8 
#keyboard setting
sed -ie 's/"us"/"hu"/g' /etc/default/keyboard
#
#remove packages
apt remove -y ubiquity ubiquity-casper ubiquity-slideshow-ubuntu ubiquity-ubuntu-artwork simple-scan shotwell gparted thunderbird gnome-mahjongg gnome-font-viewer gnome-startup-applications gnome-software gnome-characters gnome-sudoku gnome-mines gnome-calendar gnome-todo gnome-logs gnome-disk-utility gparted transmission-gtk cheese rhythmbox remmina gedit totem deja-dup aisleriot baobab language-selector-gnome update-manager software-properties-gtk update-manager-core usb-creator-gtk update-manager seahorse
apt remove libreoffice-* -y	
#installing packages
apt install -y dialog curl pipenv git python3-tk python3-pygame language-pack-en language-pack-hu gnome-user-docs-hu language-pack-gnome-hu-base language-pack-gnome-hu python3-matplotlib libxcb-xinerama0-dev dialog xdg-user-dirs-gtk git gnome-control-center  qtwebengine5-dev libwebsockets-dev libqt5webkit5 libqt5multimediawidgets5 libqt5svg5 libqt5script5 libqt5scripttools5 libqt5sql5 libqt5texttospeech5 sudo wireshark fonts-noto-cjk-extra
#installling PyCharm
wget https://download.jetbrains.com/python/pycharm-community-2022.3.3.tar.gz
cd /opt && rmdir * -r
cd
mkdir /opt/pycharm
tar -zxvf pycharm-community-*.tar.gz
mkdir /opt/pycharm-community/
chmod 777 /opt/pycharm-community/
mv pycharm-community-*/* /opt/pycharm-community/
ln -sf /opt/pycharm-community/bin/pycharm.sh /usr/bin/pycharm-community
#Creating a PyCharm desktop
cat << EOF > /usr/share/applications/pycharm.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=PyCharm
Comment= The Python IDE for Professional Developers
Exec=/opt/pycharm-community/bin/pycharm.sh
Icon=/opt/pycharm-community/bin/pycharm.png
Terminal=false
EOF
cd /opt && rm pycharm
#
#installing Visual Studio Code
#https://code.visualstudio.com/docs/setup/linux
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt install apt-transport-https -y
apt update
apt install code -y
#
#Disappear panel icons
cat > /usr/share/glib-2.0/schemas/90_ubuntu-settings.gschema.override << EOF
[org.gnome.shell]
favorite-apps =[]
EOF
#
#instaling Cisco Packet Tracer
apt install xdg-utils gtk-update-icon-cache libgl1-mesa-glx libpulse0 libnss3 libxss1,libasound2 libxslt1.1 libxkbcommon-x11-0 libxcb-xinerama0-dev libfreetype6 -y
wget https://archive.org/download/cisco-packet-tracer-821-ubuntu-64bit/CiscoPacketTracer_821_Ubuntu_64bit.deb
#dpkg -i CiscoPacketTracer_811_Ubuntu_64bit.deb
apt-get --yes --force-yes install ./Cisco*
#Creating a Packet Tracer desktop
cat << EOF > /usr/share/applications/PacketTracer.desktop 
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
# Hide apps that appear in Dash
mv /usr/share/applications/gnome-system-monitor.desktop /usr/share/applications/gnome-system-monitor.desktop.hide
#mv /usr/share/applications/org.gnome.Extensions.desktop /usr/share/applications/org.gnome.Extensions.desktop.hide
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
mv /usr/share/applications/gnome-language-selector.desktop /usr/share/applications/gnome-language-selector.desktop.hide
#
rm /etc/init/tty3.conf && rm /etc/init/tty4.conf && rm /etc/init/tty5.conf && rm /etc/init/tty6.conf
#
#removing installation packages
cd && rm * -R
#
