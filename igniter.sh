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
# Install wget
echo -e "\e[38;5;82m===>\e[0m Installing wget"
sleep 2
apt-get -y install wget
# Install nginx
echo -e "\e[38;5;82m===>\e[0m Installing Nginx"
sleep 2
apt-get -y install nginx
sleep 2
# Install Git
echo -e "\e[38;5;82m===>\e[0m Cloning CTFd "
git clone git@github.com:semprix/CTFd.git
sleep 2
echo -e "\e[38;5;82m===>\e[0m Preparing CTFd Engine "
sh /root/prepare.sh
#
# Post Installation Tasks
#
