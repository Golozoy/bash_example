#!/bin/bash

# Глава 2: Циклы

clear
echo Глава 2: Циклы

# Структура
# for var in list
# do
# команды
# done

# Перебор простых занчений

echo Перебор простых занчений

for var in first second third forurth firth
do 
    echo The $var item
done

echo -------------------------------------

# Перебор сложных занчений

echo Перебор сложных занчений

for var in first "the second" "the third" "I'll do it"
do
    echo "This is: $var"
done

echo -------------------------------------

# Инициализация цикла списком, полученным из результатов работы команды

echo Инициализация цикла списком, полученным из результатов работы команды

file="/home/q/code/bash/myfile"
IFS=$'\n' # Разделитель полей по умолчанию пробел, \t, \n
for var in $(cat $file)
do
    echo " $var"
done

echo -------------------------------------

# Обход файлов, содержащихся в директории

echo Обход файлов, содержащихся в директории

for file in /home/q/desktop/*
do
    if [ -d "$file" ]
    then
        echo "$file if a directory"
    elif [ -f "$file" ]
    then
        echo "$file is a file"
    fi
done

echo -------------------------------------

# Циклы for в стиле C

echo Циклы for в стиле C

for ((i=0; i<=10; i++))
do
    echo "number is $i"
done

echo -------------------------------------

# Цикл while

echo Цикл while

var1=5
while [ $var1 -gt 0 ]
do
    echo $var1
    var1=$[ $var1 - 1 ]
done

echo -------------------------------------

# Вложенные циклы

echo Вложенные циклы

for ((a=1; a<=3; a++))
do
    echo "Start $a:"
    for ((b=1; b<=3; b++))
    do
        echo " Inner loop: $b"
    done
done

echo -------------------------------------

# Обработка с содержимого файла

echo Обработка с содержимого файла

IFS=$'\n'
for entry in $(cat /etc/passwd)
do
    echo "Values in $entry -"
    IFS=:
    for value in $entry
    do
        echo " $value"
    done
done

echo -------------------------------------

# Управление циклами

echo Управление циклами

for var1 in 1 2 3 4 5 6 7 8 9 10
do
    if [ $var1 -eq 3 ]
    then
        continue
    fi
    if [ $var1 -eq 5 ]
    then
        break
    fi
    echo "Numver: $var1"
done

echo -------------------------------------

# Обработка вывода, выполняемого в цикле

echo Обработка вывода, выполняемого в цикле

for ((a = 1; a < 10; a++))
do
    echo "Number is $a"
done > /tmp/myfile
echo "finished"
