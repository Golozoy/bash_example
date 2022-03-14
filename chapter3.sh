#!/bin/bash

# Глава 3 Параметры и ключи командной строки

clear
echo Глава 3 Параметры и ключи командной строки

# Чтение параметров командной строки и проверка на существование

echo Чтение параметров командной строки и проверка на существование

if [ -n "$1" ] & [ -n "$2" ]
then
    echo $0
    echo $1

    total=$[ $1 + $2 ]
    echo The first parametr is $1.
    echo The second parametr is $2.
    echo The sum is $total
else
    echo No parameters found
fi

echo -------------------------------------

# Подсчет параметров
echo Подсчет параметров

echo There were $# parameters passed

echo -------------------------------------

# Получение последнего параметра

echo Получение последнего параметра

if [ "$#" -gt 2 ]
then
    echo The last parameter was ${!#}
fi

echo -------------------------------------

# Захват всех параметров командной строки

echo Захват всех параметров командной строки

if [ "$#" -gt 2 ]
then
    echo "Using the \$* method: $*" # содержит все параметры как единый фрагмент данных
    echo "------------"
    echo "Using the \$@ method: $@" # содержит все параметры как отдельные данные
fi

echo -------------------------------------

# закоментировано так как не работает следующий кусок кода

#echo закоментировано так как не работает следующий кусок кода

# команда shift 
#count=1
#while [ -n "$1" ]
#do
    #echo "Parameter #$count = $1"
    #count=$(( $count + 1 ))
    #shift
#done

#echo -------------------------------------

# Ключ командной строки
#while [ -n "$1" ]
#echo Ключ командной строки

#do
    #case "$1" in
        #-a) echo "Found the -a option" ;;
        #-b) echo "Found the -b option" ;;
        #-c) echo "Found the -c option" ;;
        #*) echo "$1 is not an option" ;;
    #esac
    #shift
#done

#echo -------------------------------------

# Как различать ключи и параметры

#echo Как различать ключи и параметры

#while [ -n "$1" ]
#do
    #case "$1" in
        #-a) echo "Found the -a option" ;;
        #-b) echo "Found the -b option" ;;
        #-c) echo "Found the -c option" ;;
        #--) shift
            #break;;
        #*) echo "$1 is not an option";;
    #esac
    #shift
#done
#count=1
#for param in $@
#do
    #echo "Parameter #$count: $param"
    #count=$(( $count + 1 ))
#done

#echo -------------------------------------

# Обработка ключей со значениями

echo Обработка ключей со значениями

while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option";;
        -b) param="$2"
            echo "Found the -b option, with parameter value $param"
            shift ;;
        -c) echo "Found the -c option";;
        --) shift
            break ;;
        *) echo "$1 is not an option";;
    esac
    shift
done
count=1
for param in "$@"
do
    echo "Parameter #$count: $param"
    count=$(( $count + 1 ))
done

echo -------------------------------------

# Использование стандартных ключей

#echo Использование стандартных ключей

# -a Вывести все объекты.
# -c Произвести подсчёт.
# -d Указать директорию.
# -e Развернуть объект.
# -f Указать файл, из которого нужно прочитать данные.
# -h Вывести справку по команде.
# -i Игнорировать регистр символов.
# -l Выполнить полноформатный вывод данных.
# -n Использовать неинтерактивный (пакетный) режим.
# -o Позволяет указать файл, в который нужно перенаправить вывод.
# -q Выполнить скрипт в quiet-режиме.
# -r Обрабатывать папки и файлы рекурсивно.
# -s Выполнить скрипт в silent-режиме.
# -v Выполнить многословный вывод.
# -x Исключить объект.
# -y Ответить «yes» на все вопросы.

# Получение данных от пользователя

echo Получение данных от пользователя

echo -n "Enter your name: "
read name
echo "Hello $name, welcome to my program"

read -p "Enter you name: " first last
echo "Your data for $last, $first..."

read -p "Enter your name: "
echo Hello $REPLY, welcome to my program.

echo -------------------------------------

# ввод паролей

echo ввод паролей

read -s -p "Enter your password: " pass
echo "Is your password really $pass? "

echo -------------------------------------

# Чтение данных из файла

echo Чтение данных из файла

count=1
cat /home/q/code/bash/myfile | while read line
do
    echo "Line $count: $line"
    count=$(( $count + 1 ))
done
echo "finished"
