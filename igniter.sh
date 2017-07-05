#!/bin/bash

# CTF Igniter
# A fast CTF deployment tool, the tool will deploy Nginx and use CTFd engine.
# author: @semprix
#
#

# Debian setup

currentdir=`pwd`

echo -e "\e[38;5;82m*******************************************************************************\e[0m"
echo -e "\e[38;5;82mCTF Igniter is a fast CTF deployment tool, it will deploy custom CTFd Engine   \e[0m"
echo -e "\e[38;5;82m*******************************************************************************\e[0m"
echo ""
echo -e "\e[38;5;82m===>\e[0m Checking if run as root"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo -e "\e[31m[--] This script must be run as root\e[0m" 1>&2
   exit 1
else
   echo -e "\e[38;5;82m[++]\e[0m We are root!!!"
fi
echo -e "\e[38;5;82m===>\e[0m Updating package tree"
sleep 3
# Update tree
apt-get update
# Set locale first to prevent locale errors
echo -e "\e[38;5;82m===>\e[0m Exporting locale"
export LC_ALL=C

# Stage 1 Installation
# Install sudo
echo -e "\e[38;5;82m===>\e[0m Installing sudo"
sleep 2
apt-get -y install sudo
sleep 2
# Install Python essentials
echo -e "\e[38;5;82m===>\e[0m Installing Python essentials"
sleep 2
apt-get -y install python-dev build-essential
sleep 2
# Install Python pip
echo -e "\e[38;5;82m===>\e[0m Installing pip"
sleep 2
apt-get -y install python-pip
sleep 2
# Upgrade Python pip
echo -e "\e[38;5;82m===>\e[0m Upgrading pip"
sleep 2
pip install --upgrade pip
sleep 2
# Install unzip
echo -e "\e[38;5;82m===>\e[0m Installing unzip"
sleep 2
apt-get -y install unzip
sleep 2
# Install git
echo -e "\e[38;5;82m===>\e[0m Installing Git "
sleep 2
apt-get -y install git
sleep 2
# Install vim
echo -e "\e[38;5;82m===>\e[0m Installing vim"
sleep 2
apt-get -y install vim
# Install multitail
echo -e "\e[38;5;82m===>\e[0m Installing multitail"
sleep 2
apt-get -y install multitail

# Stage 2 Installation
# Perform merge
cd payload
echo -e "\e[38;5;82m===>\e[0m Merging updates"
git clone https://github.com/CTFd/CTFd.git $currentdir/payload/CTFd
echo -e "\e[38;5;82m===>\e[0m Preparing CTFd payload"
cd $currentdir/payload/CTFd
sleep 2
sh prepare.sh
sleep 2
echo -e "\e[38;5;82m===>\e[0m Creating document root"
sleep 2
mkdir -p /var/www
sleep 2
echo -e "\e[38;5;82m===>\e[0m Copying payload to /var/www"
sleep 2
cp -R $currentdir/payload/CTFd /var/www
sleep 2
echo -e "\e[38;5;82m===>\e[0m Copying assets"
sleep 2
cp $currentdir/assets/static/views.py /var/www/CTFd/CTFd
cp $currentdir/assets/static/admin/templates/base.html /var/www/CTFd/CTFd/themes/admin/templates
cp $currentdir/assets/static/original/templates/base.html /var/www/CTFd/CTFd/themes/original/templates

sleep 2

#
# Stage 3 Installation
#
echo -e "\e[38;5;82m[++]\e[0m Performing post-installation cleanup"
cp $currentdir/serve.py /var/www/CTFd
echo -e "\e[38;5;82m===>\e[0m CTFIgniter installation finish"
echo -e "\e[38;5;82m===>\e[0m Starting CTFIgniter"
sleep 2
cd /var/www/CTFd
python serve.py
