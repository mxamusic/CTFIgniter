#/bin/bash

# CTF Igniter
# author: @semprix
#
#
#

echo "======================================="
echo "        Capture The Flag Igniter       "
echo "======================================="
echo ""
echo "CTF Igniter will install CTFd engine and all its dependencies"
echo ""
echo -e "\e[38;5;82m--> Checking if run as root\e[0m"

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo -e "\e[31m[--] This script must be run as root\e[0m" 1>&2
   exit 1
else
   echo -e "\e[38;5;82m[++] We are root!!!\e[0m"
fi
echo -e "\e[38;5;82m===>\e[0m Updating tree"
sleep 3
# Update tree
apt-get update
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

# Bootstrapping pip
echo -e "\e[38;5;82m===>\e[0m Bootstrapping pip "
wget https://bootstrap.pypa.io/get-pip.py
# Switch to /var/www directory
cd /var/www/
# Install Git
echo -e "\e[38;5;82m===>\e[0m Cloning CTFd"
git clone https://github.com/semprix/CTFd.git
sleep 2
echo -e "\e[38;5;82m===>\e[0m Exporting locale"
export LC_ALL=C
echo -e "\e[38;5;82m===>\e[0m Preparing CTFd Engine"
cd /var/www/CTFd
sleep 2
sh prepare.sh
#
# Post Installation Tasks
#
echo -e "\e[38;5;82m===>\e[0m Performing cleanup"
rm -rf docker-compose-run.sh docker-compose.yml Dockerfile populate.py README.md
echo -e "\e[38;5;82m===>\e[0m Edit nginx config"
