# bash script
## Network setup

скрипт для изменения IP адреса на определенном интерфейсе 

## Особенности

- Выбор интерфейса
- Выбор на какой IP вы хотите изменить
- Защита от случайного изменения
- Вывод всех ваших интерфейсов и IP

## Запуск

Скачайте файл и переместите его в любую удобную вам директорию

```sh
cd [ваша директория]
chmod a+x bash.s
./bash.sh
```
# Использование
Current network settings:
Interface: lo:, IP Address: 127.0.0.1/8
Interface: enp1s0:, IP Address: 192.168.124.9/24

Enter the interface to modify: напишите какой интерфейс вы хотите изменить
Enter the interface to modify: 
Enter the new IP address: введите новый айпи адрес
confirm: подтвердите что точно хотите изменить конфигурацию (y)
IP address successfully changed to new interface вывод того что код сработал и конфигурация изменена



