#!/bin/bash

# Глава 4 Ввод и вывод

clear

# Временное перенаправление ввывода

echo Временное перенаправление ввывода

echo "This is an error" >&2
echo "This is normal output"

echo --------------------------------

# Постоянное перенаправление вывода

echo Постоянное перенаправление вывода

exec 1>outfile
echo "This is a test of redirecting all output"
echo "from a shell script to another filr."
echo "without having to redirect every line"
exec 1>/dev/tty

echo --------------------------------

exec 2>myerror
echo "This is the start of the script"
echo "now redirecting all output to another location"
exec 1>myfile
echo "This should go to the myfile file"
echo "and this should go to the myerror file" >&2
exec &>/dev/tty

echo --------------------------------

# Перенаправление ввода в скриптах

echo Перенаправление ввода в скриптах

exec 0< testfile
count=1
while read line
do
    echo "line #$count: $line"
    count=$(( $count + 1 ))
done
exec 0</dev/tty

echo --------------------------------

# Создание собственного преренаправления вывода

echo Создание собственного преренаправления вывода

exec 3>myfile
echo "This should display on the screen"
echo "and this sould be stored in the file" >&3
echo "And this should be back the screen"
exec 3>&-

echo --------------------------------

# Создание дескрипторов файлов для ввода данных

echo Создание дескрипторов файлов для ввода данных
exec 6<&0
exec 0< testfile
count=1
while read line
do
    echo "Line #$count: $line"
    count=$(( $count + 1 ))
done
exec 0<&6
read -p "Are you done now? " answer
case $answer in
    y) echo "Goodbye";;
    n) echo "Sorry, this is the end.";;
esac

echo --------------------------------

# Закрытие дескрипторов файлов

echo Закрытие дескрипторов файлов
exec 3> myfile
echo "This is a test line of date" >&3
exec 3>&-
echo "This won't work" >&3

echo --------------------------------

# получение сведений об открытых дускрипторах

echo получение сведений об открытых дускрипторах

exec 3> myfile1
exec 6> myfile2
exec 7< myfile3
lsof -a -p $$ -d 0,1,2,3,6,7
exec 3>&-
exec 6>&-
exec 7>&-
