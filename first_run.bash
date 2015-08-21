#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y guake gcc g++ python emacs perl make units git git-cola fish python-pip screen
cp emacs.el ~/.emacs
wget https://raw.githubusercontent.com/juba/color-theme-tangotango/master/tangotango-theme.el
mkdir -p /root/.emacs.d
cp tangotango-theme.el /root/.emacs.d/
mv tangotango-theme.el ~/.emacs.d/
cp config.fish /etc/fish/
mkdir $HOME/shell-scripts
cp UpdateServer.sh $HOME/shell-scripts
echo "Done"
