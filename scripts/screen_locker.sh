#!/bin/bash

#depends on: imagemagick, i3lock, scrot

IMAGE=/tmp/lockscreen.png
TEXT=/tmp/locktext.png
# ICON=/home/thapakazi/Pictures/extra/locks/bhote_talcha.png
ICON=/home/thapakazi/Pictures/extra/locks/bhote_talcha.png

#cleanups
# rm -rf /tmp/lock{screen,text}.png

scrot $IMAGE
convert $IMAGE -scale 10% -scale 1000% -fill black -colorize 25% $IMAGE
[ -f $TEXT ] || { 
    convert -size 3000x60 xc:white -font Lohit-Devanagari -pointsize 26 -fill black -gravity center -annotate +0+0 'भोटे ताला हो, खोल्न अाउछ नानी || बाबु ?' $TEXT;
    convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT; 
}
convert $IMAGE $TEXT -gravity center -geometry +0+200 -composite $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE
i3lock -b -d -i $IMAGE
