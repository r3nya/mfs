#!/bin/bash
# Script for R.

add='add-apt-repository'

#repos

# Samsung-tools
$add ppa:voria

# openshot
$add ppa:openshot.developers/ppa

# TransmissionBT
$add ppa:transmissionbt/ppa

# Unity
$add ppa:unity/ppa

# LibreOffice
$add ppa:libreoffice/ppa

# Chromium stable
$add ppa:chromium-daily/stable

# umplayer+mplayer
$add ppa:webupd8team/umplayer
$add ppa:motumedia/mplayer-daily

# deadbeef
$add ppa:alexey-smirnov/deadbeef

# ubuntu-tweak
$add ppa:tualatrix/ppa

$add "deb http://linux.dropbox.com/ubuntu $(lsb_release -cs) #main" && wget -q -O- http://ubuntu-tweak.com/source/dropbox/key | apt-key add -

apt-key adv --keyserver pgp.mit.edu --recv-keys 0xd66b746e
wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && \
apt-get --quiet update && apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring

#Installing software
apt-get --yes --quiet --allow-unauthenticated install `cat ./R_list.txt | sed 's/^\#.*//g' |tr -s "[\n]" | sed -e :a -e '$!N;s/\n/\ /;ta'`

#Upgrade
apt-get upgrade
