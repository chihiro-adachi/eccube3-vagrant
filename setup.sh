#!/bin/sh

# ---------------
# yum install
# ---------------

yum install git -y
yum install httpd -y
yum install mysql mysql-server -y
yum install postgresql postgresql-server -y
yum install php php-gd php-mbstring php-pdo php-mysql php-pgsql php-xml php-soap -y

# ---------------
# set up iptables
# ---------------

service iptables stop
chkconfig iptables off

# ---------------
# set up pgsql
# ---------------

sudo -u postgres initdb -D /var/lib/pgsql/data --no-locale --encoding=UTF8
cp -f /vagrant/etc/pgsql/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
service postgresql start
chkconfig postgresql on

# ---------------
# set up httpd
# ---------------

cp -f /vagrant/etc/httpd/httpd.conf /etc/httpd/conf/httpd.conf
cp -f /vagrant/etc/php/php.ini /etc/php.ini
service httpd start
chkconfig httpd on

# ---------------
# set up ec-cube
# ---------------

sudo -u postgres createuser cube3_dev_user -s
sudo -u postgres psql -c "ALTER ROLE cube3_dev_user WITH PASSWORD 'password';"