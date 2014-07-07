#!/usr/bin/env bash
echo -e "\n--- DoOurStuff---\n"
echo -e "\n--- LastUpDate:RDO@03072014---\n"
echo -e "\n-------------------------------\n"
echo -e "\n--- #01 DefineVariables---\n"

APPENV=local
DBHOST=localhost
DBNAME=typo3Playground
DBNAME02=wordpressPlayground
DBUSER=root
DBPASSWD=root

echo -e "\n--- #02 Updates the Ubuntu Repositorys---\n"
apt-get update

echo -e "\n--- #03 Installs Apache2---\n"
apt-get install -y apache2

a2ensite default
a2ensite default-ssl
a2ensite playground
apache2ctl restart

echo -e "\n--- #04 MySQL Installation---\n"
# Set Password for user "root" to root
export DEBIAN_FRONTEND=noninteractive
apt-get install -q -y mysql-server
mysqladmin -u root password root

echo -e "\n--- #05 PhpMyAdmin Installation---\n"
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
apt-get install -q -y phpmyadmin

echo -e "\n--- #06 Install PHP5 on the Server---\n"
apt-get install -y php5
apt-get install -y php-pear php-apc

echo -e "\n--- #07 Install the Graphicsmagick Lib---\n"
apt-get install -y graphicsmagick

#echo -e "\n--- # Install Git---\n"
apt-get install -y git

echo -e "\n--- #08 Setting New User---\n"
useradd -G vagrant,admin -m -s /bin/bash dev
echo "dev:dev" | chpasswd
ln -fs /vagrant /home/dev/vagrant-folder

echo -e "\n---#09 Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME02"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME02.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"

echo -e "\n--- We Wget the latest LTS Typo3 Installation---\n"
cd /var/www/playground/
//mkdir -p typo3Core
wget  get.typo3.org/current -O typo3_src.tgz
tar xvfz typo3_src.tgz

echo -e "\n--- We Wget the latest LTS Wordpress Installation---\n"
cd /var/www/playground/
wget  https://wordpress.org/latest.tar.gz
tar xvfz latest.tar.gz
echo -e "\n---------------------------------------------done\n"
echo -e "\n-------------------------------------------------\n"
echo -e "\n--------------MoveDownloads2downloadFolder-------\n"
cd /var/www/playground/
mv latest.tar.gz downloads
mv typo3_src.tgz downloads
echo -e "\n-------------------------------------------------\n"
echo -e "\n-------------------------------------------------\n"
echo -e "\n------------makeSomeHacks4Typo3------------------\n"
cd /var/www/playground/typo3_src-6.2.3
touch FIRST_INSTALL
chown www-data:www-data FIRST_INSTALL

echo -e "\n-------------------------------------------------\n"
echo -e "\n-------------------------------------------------\n"

echo -e "\n-------------------------------------------------\n"
echo -e "\n--- #10 StartOurEngines ... (C:               ---\n"
echo -e "\n-------------------------------------------------\n"
echo -e "May adjust this to our Host"
echo -e "sudo nano /private/etc/hosts"
echo -e " 127.0.0.1 playground.loc"
echo -e " 127.0.0.1 www.playground.loc"
echo -e "\n-------------------------------------------------\n"
echo -e "\n----------------------------------------------eof\n"