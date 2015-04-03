#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
cp emacs.el ~/.emacs
wget https://raw.githubusercontent.com/juba/color-theme-tangotango/master/color-theme-tangotango.el
mv color-theme-tangotango.el /usr/share/emacs/site-lisp/
echo "Done" 
