# Ticket №5 Nextcloud 

> Установка и нстройкуа Haproxy на Rocky9 в PROXMOX контейнеры по принципу Node -1, Node-2, Master. На ноды установить JS приложение (Exam local) написание документации. 

> Нужные команды для установки и запуска скрипта ниже

Hostname - Haproxy/Node1/Node2

Firewall - disable

IPv4 - DHCP

`Вход под root -`
su root

`Установка Гита` -
dnf -y install git

`Скачивания файла` -
git clone https://github.com/icymust/ticket5

`Разрешение доступа файлам -`
chmod -R 777 . 

`Переключение чата в правами админа -`
sudo su

`Запуск скрипта -`
./install_().sh
