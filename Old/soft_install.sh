#!/bin/bash

add='add-apt-repository'
#repos

# LibreOffice
$add ppa:libreoffice/ppa
# umplayer+mplayer
$add ppa:webupd8team/umplayer
$add ppa:motumedia/mplayer-daily
# deadbeef
$add ppa:alexey-smirnov/deadbeef
# docky
#$add ppa:docky-core
# psi+
#add-apt-repository ppa:zerkalica/psi-plus
# ubuntu-tweak
$add ppa:tualatrix/ppa
# Elementary
#add-apt-repository ppa:elementaryart/ppa
#add-apt-repository ppa:elementaryart/elementarydesktop
# itmages.ru
$add ppa:itmages/software
$add "deb http://apt.wakoopa.com all main" && wget -q -O- http://apt.wakoopa.com/pubkey.txt | apt-key add -
$add "deb http://archive.getdeb.net/ubuntu $(lsb_release -cs)-#getdeb games" && wget -q -O- http://archive.getdeb.net/getdeb-archive.key | apt-key add -
$add "deb http://linux.dropbox.com/ubuntu $(lsb_release -cs) #main" && wget -q -O- http://ubuntu-tweak.com/source/dropbox/key | apt-key add -
echo "deb http://download.skype.com/linux/repos/debian/ stable non-free #Skype" | tee -a /etc/apt/sources.list > /dev/null

apt-key adv --keyserver pgp.mit.edu --recv-keys 0xd66b746e
wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && \
apt-get --quiet update && apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring

#Installing software
apt-get --yes --quiet --allow-unauthenticated install `cat ./list.txt | sed 's/^\#.*//g' |tr -s "[\n]" | sed -e :a -e '$!N;s/\n/\ /;ta'`

#Upgrade
apt-get upgrade
