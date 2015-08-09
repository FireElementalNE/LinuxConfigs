#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
pacman -Syu
pacman -S pulseaudio pulseaudio-alsa pavucontrol gnome-terminal flashplugin vlc chromium unzip unrar p7zip gedit gnome-system-monitor a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins git guake gcc  python2 emacs  perl  make  units  fish  python-pip screen 
cp ../emacs.el ~/.emacs
wget https://raw.githubusercontent.com/juba/color-theme-tangotango/master/color-theme-tangotango.el
mv color-theme-tangotango.el ~/emacs.d/
cp ../config.fish /etc/fish/