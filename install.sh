dnf -y install wget unzip httpd
setenforce 0
sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
systemctl enable --now httpd 
dnf -y install http://rpms.remirepo.net/enterprise/remi-release-8.rpmsudo
dnf update
dnf -y install epel-release
dnf module reset php
sudo dnf module reset php
dnf module enable php:remi-8.0
dnf -y install php php-cli php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-pdo php-pecl-apcu php-pecl-apcu-devel php-ldap
dnf install mariadb-server mariadb
systemctl enable --now mariadb
mysql -u root
CREATE USER 'jkisp23'@'localhost' IDENTIFIED BY "jkisp23";
CREATE DATABASE jkisp23db;
GRANT ALL PRIVILEGES ON jkisp23db.* TO 'jkisp23'@'localhost';
FLUSH PRIVILEGES;
exit;
sudo su
wget https://download.nextcloud.com/server/releases/nextcloud-23.0.0.zip 
unzip nextcloud-*.zip 
sudo mv nextcloud/ /var/www/html/ 
mkdir /var/www/html/nextcloud/data
chown apache:apache -R /var/www/html/nextcloud
firewall-cmd --add-service={http,https} --permanent
firewall-cmd –reload
