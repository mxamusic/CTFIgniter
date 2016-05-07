#/bin/bash

# CTF Igniter
# A fast CTF deployment tool, the tool will deploy Nginx and use CTFd engine.
# author: @semprix
#
#

echo -e "\e[38;5;82m*******************************************************************************\e[0m"
echo -e "\e[38;5;82mCTF Igniter is a fast CTF deployment tool, it will deploy Nginx and CTFd Engine\e[0m"
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
echo -e "\e[38;5;82m===>\e[0m Updating tree"
sleep 3
# Update tree
apt-get update
# Set locale first to prevent locale errors
echo -e "\e[38;5;82m===>\e[0m Exporting locale"
export LC_ALL=C
# Install git-core
echo -e "\e[38;5;82m===>\e[0m Installing Git "
sleep 2
apt-get -y install git-core
sleep 2
# Install Nginx
echo -e "\e[38;5;82m===>\e[0m Installing Nginx"
sleep 2
apt-get -y install nginx
# Install nginx
echo -e "\e[38;5;82m===>\e[0m Installing wget"
sleep 2
apt-get -y install wget
sleep 2
# Install sudo
echo -e "\e[38;5;82m===>\e[0m Installing sudo"
sleep 2
apt-get -y install sudo
sleep 2

# Phase 2 Installation

# Fetch get-pip to initialize pip
echo -e "\e[38;5;82m===>\e[0m Bootstrapping pip "
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
# Switch to /var/www directory
cd /var/www/
# Extracting CTFd from semprix repo
echo -e "\e[38;5;82m===>\e[0m Extracting CTFd engine to www root"
cp -R /root/CTFIgniter/payload/CTFd /var/www
sleep 2
echo -e "\e[38;5;82m===>\e[0m Building essentials"
apt-get install build-essential python-dev python-pip libffi-dev -y
sleep 2
echo -e "\e[38;5;82m===>\e[0m Fetching required python libraries"
currentdir=`pwd`
pip install -r $currentdir/requirements.txt
echo -e "\e[38;5;82m===>\e[0m Fetching uwsgi"
sleep 2
pip install uwsgi

#
# Post Installation Tasks
#
echo -e "\e[38;5;82m===>\e[0m Performing cleanup"
rm -rf docker-compose-run.sh docker-compose.yml Dockerfile populate.py README.md
echo -e "\e[38;5;82m===>\e[0m Forcing Stop Nginx"
killall nginx
sleep 3
echo -e "\e[38;5;82m===>\e[0m Starting Nginx"
service nginx start
echo -e "\e[38;5;82m===>\e[0m Edit nginx config (use CTFIgniter/conf/ctfd.nginx.conf configuration file for Nginx)"
echo -e "\e[38;5;82m===>\e[0m Start CTFd by using CTFIgniter/scripts/startup.sh"
sleep 2
echo -e "\e[38;5;82m===>\e[0m Finishing....."
echo -e "\e[38;5;82m===>\e[0m Done"
