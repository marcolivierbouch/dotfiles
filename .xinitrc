#! /bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#exec startxfce4
exec i3
