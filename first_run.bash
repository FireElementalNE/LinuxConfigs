#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y guake gcc g++ python emacs emacs-goodies-el perl make units git git-cola fish python-pip screen
cp emacs.el ~/.emacs
wget https://raw.githubusercontent.com/juba/color-theme-tangotango/master/color-theme-tangotango.el
mv color-theme-tangotango.el /usr/share/emacs/site-lisp/
cp config.fish /etc/fish/
echo "Done"
