#!/bin/bash
# Script for R.

add='add-apt-repository'

# repos

# Samsung-tools
$add ppa:voria

# Hotot twitter client
$add ppa:hotot-team

#Opera Browser
$add 'deb http://deb.opera.com/opera/ stable non-free'
wget -O - http://deb.opera.com/archive.key | apt-key add -

# Openshot
$add ppa:openshot.developers/ppa

# TransmissionBT
$add ppa:transmissionbt/ppa

# WebUpd8 Themes PPA
$add ppa:webupd8team/themes

# Unity
$add ppa:unity/ppa

# LibreOffice
$add ppa:libreoffice/ppa

# Chromium stable
$add ppa:chromium-daily/stable

# umplayer+mplayer
$add ppa:webupd8team/umplayer
$add ppa:motumedia/mplayer-daily

# Deadbeef
$add ppa:alexey-smirnov/deadbeef

# Ubuntu-tweak
$add ppa:tualatrix/ppa

# Dropbox
$add "deb http://linux.dropbox.com/ubuntu $(lsb_release -cs) #main" && wget -q -O- http://ubuntu-tweak.com/source/dropbox/key | apt-key add -

# Medibuntu
apt-key adv --keyserver pgp.mit.edu --recv-keys 0xd66b746e
wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && \
apt-get --quiet update && apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring

#Installing software
apt-get --yes --quiet --allow-unauthenticated install `cat ./R_list.txt | sed 's/^\#.*//g' |tr -s "[\n]" | sed -e :a -e '$!N;s/\n/\ /;ta'`

#Upgrade
apt-get upgrade

# Well done ^^
