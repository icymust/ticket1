# Ticket №5 Nextcloud 

> Установка и нстройкуа Haproxy на PROXMOX контейнеры по принципу Node -1, Node-2, Master. На ноды установить JS приложение (Exam local) написание документации. 

> Нужные команды для установки и запуска скрипта ниже

`Вход под root -`
su root

`Поменять сетевые данные -`
vi /etc/sysconfig/network-scripts/ifcfg-ens18 

<li>PRESS "I"
<li>BROWSER_ONLY=NO -> YES
<li>ONBOOT=no -> YES
<li>PRESS "ESC" -> :wq
  
`Перезапустить сетевые данные -`
systemctl restart NetworkManager

`Установка Гита` -
dnf -y install git

`Скачивания файла` -
git clone https://github.com/icymust/ticket6

`Разрешение доступа файлам -`
chmod -R 777 . 

`Переключение чата в правами админа -`
sudo su

`Запуск скрипта -`
./install.sh

`Перезапуск системы -`
reboot
