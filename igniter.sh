#/bin/bash

echo "======================================="
echo "        Capture The Flag Igniter       "
echo "======================================="
echo ""
echo "CTF Igniter will install Mellivora CTF Engine and its dependencies"
echo ""
echo -e "\e[38;5;82m--> Checking if run as root\e[0m"

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo -e "\e[31m[--] This script must be run as root\e[0m" 1>&2
   exit 1
else
   echo -e "\e[38;5;82m[++] We are root!!!\e[0m"
fi

echo -e "\e[38;5;82m==>\e[0m Preparing Apache, MySQL and PHP Installation"
echo -e "\e[38;5;82m-->\e[0m Updating tree"
sleep 3

# Update tree
apt-get update
echo -e "\e[38;5;82m-->\e[0m Installing MySQL "
sleep 2
apt-get -y install mysql-server mysql-client
sleep 2
echo -e "\e[38;5;82m-->\e[0m Installing Apache webserver (user inputs needed)"
sleep 2
apt-get -y install apache2
echo -e "\e[38;5;82m-->\e[0m Installing PHP and other modules"
echo -e "\e[38;5;82m[+]\e[0m php5"
echo -e "\e[38;5;82m[+]\e[0m php5-mysql"
echo -e "\e[38;5;82m[+]\e[0m php5-curl"
sleep 2
apt-get -y install php5 php5-mysql libapache2-mod-php5
sleep 2
apt-get -y install curl libcurl3 libcurl3-dev php5-curl
sleep 2
echo -e "\e[38;5;82m-->\e[0m Installing Git version control "
apt-get -y install git-core
sleep 2
echo -e "\e[38;5;82m-->\e[0m Fetching composer (getcomposer.org)"
sleep 2
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash_file('SHA384', 'composer-setup.php') === '7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
echo -e "\e[38;5;82m-->\e[0m Moving composer to /usr/local/bin/"
mv composer.phar /usr/local/bin/composer
sleep 2
echo -e "\e[38;5;82m==>\e[0m Finishing Installation"
echo ""

# Post Installation Tasks
echo -e "\e[38;5;82m==>\e[0m Post Installation Tasks"
echo -e "\e[38;5;82m[+]\e[0m Run sudo mysql_secure_installation"
echo -e "\e[38;5;82m[+]\e[0m Configure php.ini"
echo -e "\e[38;5;82m[+]\e[0m Run composer install (mellivora root directory)"
sleep 3
echo -e "\e[38;5;82m[*] Install Done!!!\e[0m"
echo -e "\e[38;5;82m[*] Start uploading CTF Challenges\e[0m"
