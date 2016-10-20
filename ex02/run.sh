#! /bin/bash
#credit goes to https://gist.githubusercontent.com/kvzhuang for their helpful article upon which this is based
#dnsmasq provides network infrastructure for small networks: DNS, DHCP, router advertisements and network boot
service dnsmasq restart &
#tells it to sleep so it waits until attempting to restart the service. Otherwise the service would start prematurely.
sleep 5
apt-get update
#installs packages
#installs multi-processing module (MPM) server that implements a non-threaded pre-forking web server. The -y part helps decrease user dependency by authorizing it to install without asking
apt-get install -y apache2
#installs php5 package
apt-get install -y php5
apt-get install -y memcached
#curl is a multiprotocol file transfer library
apt-get install -y curl
#php-curl is a library specific to php5
apt-get install -y php5-curl
apt-get install -y php5-memcached
#pear is a php extention add application repository responsible for distribution of reusable php components
apt-get install -y php-pear
#expect is a tool for automating interactive applications
apt-get install -y expect
#includes the scp library for securely copying the shell script for executing
apt-get install -y scp

#this is for PHPUnit. This is useful for debugging
#auto_discover new channels from command line for the debugging
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit

#hand update locale for local, this instance only
LC_TIME locale-gen en_US en_US.UTF-8
#this sets up 
mkdir -p /home/m/share/htdosc/log/apache
#this is my repo apache setting, I linked to apache sites-available
ln -s /home/m/share/htdocs/GIT_LOCATION/apache/your_own.conf /etc/apache2/sites-available/your_own.conf
ln -s /etc/apache2/sites-available/your_own.conf /etc/apache2/sites-enabled/your_own.conf

#remove default apache config and php files for timezone setting
rm /etc/apache2/sites-enabled/000-default
rm /etc/php5/apache2/php.ini
cp /home/m/share/htdocs/GIT_LOCATION/php/php.ini /etc/php5/apache2/

#I use apache2 rewrite.
a2enmod rewrite
#git pull for newest call
cd /home/m/share/htdocs/GIT_LOCATION;git -f pull;cd /
