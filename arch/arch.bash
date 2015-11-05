#!/bin/bash
sudo pacman -Syu
sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol gnome-terminal flashplugin vlc chromium unzip unrar p7zip gedit gnome-system-monitor a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins git guake python2 emacs perl units fish python-pip screen viewnior vim
cp ../emacs.el $HOME/.emacs
wget https://raw.githubusercontent.com/juba/color-theme-tangotango/master/tangotango-theme.el
mv tangotango-theme.el $HOME/.emacs.d/
sudo cp ../config.fish /etc/fish/
