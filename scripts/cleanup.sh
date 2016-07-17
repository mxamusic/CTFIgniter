#!/bin/bash
#
# CTF Igniter
# A fast CTF deployment tool, the tool will deploy Nginx and use CTFd engine.
# author: @semprix
#
#

currentdir=`pwd`

echo -e "\e[38;5;82m===>\e[0m Starting cleanup"
sleep 2
echo -e "\e[38;5;82m===>\e[0m Deleting db file"
rm -rf $currentdir/CTFd/ctfd.db
echo -e "\e[38;5;82m===>\e[0m Deleting pyc files"
rm -rf $currentdir/CTFd/*.pyc
echo -e "\e[38;5;82m===>\e[0m Deleting logs"
rm -rf $currentdir/CTFd/logs
echo -e "\e[38;5;82m===>\e[0m Deleting sockets"
rm -rf /tmp/uwsgi.sock
echo -e "\e[38;5;82m===>\e[0m Done!"
