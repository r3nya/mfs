#!/bin/bash
# Script for R.

#repos

# Samsung-tools
add-apt-repository ppa:voria

# Unity
add-apt-repository ppa:unity/ppa

# LibreOffice
add-apt-repository ppa:libreoffice/ppa

# Chromium stable
add-apt-repository ppa:chromium-daily/stable

# umplayer+mplayer
add-apt-repository ppa:webupd8team/umplayer
add-apt-repository ppa:motumedia/mplayer-daily

# deadbeef
add-apt-repository ppa:alexey-smirnov/deadbeef

# ubuntu-tweak
add-apt-repository ppa:tualatrix/ppa

add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -cs) #main" && wget -q -O- http://ubuntu-tweak.com/source/dropbox/key | apt-key add -

apt-key adv --keyserver pgp.mit.edu --recv-keys 0xd66b746e
wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && \
apt-get --quiet update && apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring

#Installing software
apt-get --yes --quiet --allow-unauthenticated install `cat ./R_list.txt | sed 's/^\#.*//g' |tr -s "[\n]" | sed -e :a -e '$!N;s/\n/\ /;ta'`

#Upgrade
apt-get upgrade
