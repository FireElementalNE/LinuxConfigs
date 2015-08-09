#!/bin/bash
sudo pacman -Syu
# sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol gnome-terminal flashplugin vlc chromium unzip unrar p7zip gedit gnome-system-monitor a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins git guake gcc  python2 emacs  perl  make  units  fish  python-pip screen 
cp ../emacs.el $HOME/.emacs
wget https://raw.githubusercontent.com/juba/color-theme-tangotango/master/color-theme-tangotango.el
mv color-theme-tangotango.el $HOME/.emacs.d/
sudo cp ../config.fish /etc/fish/
