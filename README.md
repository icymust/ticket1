# Ticket №1 Nextcloud 

> Установка и первичная настройка Nextcloud на Rocky. Закрытие служебных портов на ОС с
> Nextcloud. Смена SSH порта на 22128. Написание документации

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

`Скачивания файла` -
git clone https://github.com/icymust/ticket1

`Разрешение доступа файлам -`
chmod -R 777 . 

`Переключение чата в правами админа -`
sudo su

`Запуск скрипта -`
./install.sh

`Перезапуск системы -`
reboot
