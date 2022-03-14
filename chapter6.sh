#!/bin/bash

# Глава 6 Функции и разработка библиотек
clear

# Использование функций

echo Использование функций

function myfunc {
    echo "This is an example of using a function"
}
count=1
while [ $count -le 3 ]
do
    myfunc
    count=$(( $count + 1 ))
done
echo "This is the end of the loop"
myfunc
echo "End of the script"

echo -------------------------------------

# использование команды return

echo использование команды return

function myfunc {
    read -p "Enter a value: " value
    echo "adding value"
    return $(( $value + 10 ))
}
myfunc
echo "the new value is $?"

echo ------------------------------------

# Запись вывода функции в переменную

echo Запись вывода функции в переменную

function myfunc {
    read -p "Enter a value: " value
    echo $(( $value + 10 ))
}
result=$(myfunc)
echo "The value is $result"

echo ------------------------------------

# Аргументы функции

echo Аргументы функции

function addnum {
    if [ $# -eq 0 ] || [ $# -gt 2 ]
        then
        echo -1
    elif [ $# -eq 1 ]
        then
        echo $(( $1 + $1 ))
    else
        echo $(( $1 + $2 ))
    fi
}
echo -n "Adding 10 and 15: "
value=$(addnum 10 15)
echo $value
echo -n "Adding one number: "
value=$(addnum 10)
echo $value
echo -n "Adding no numbers: "
value=$(addnum)
echo $value
echo -n "Adding three numbers: "
value=$(addnum 10 15 20)
echo $value

echo ------------------------------------

# Глобальные переменные

echo Глобальные переменные

function myfunc {
    value=$(( $value + 10 ))
}
read -p "Enter a value: " value
myfunc
echo "The new value is: $value"

echo ------------------------------------

# Локальные переменные

echo Локальные переменные

function myfunc {
    local temp=$[ $value + 5 ]
    echo "The Temp from inside function is $temp"
}
temp=4
myfunc
echo "The temp from outside is $temp"

echo ------------------------------------

# Передача функциям массивов в качестве аргументов

echo Передача функциям массивов в качестве аргументов

function myfunc {
    echo "The parameters are: $@"
    arr=$1
    echo "The received array is ${arr[*]}"
}
myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
myfunc $myarray

echo ------------------------------------

function myfunc {
    local newarray
    newarray=("$@")
    echo "The new array value is: ${newarray[*]}"
}
myarray=(1 2 3 4 5)
echo "The original array is ${myarray[*]}"
myfunc ${myarray[*]}

echo ------------------------------------

# Рекурсивные функции

echo Рекурсивные функции

function factorial {
    if [ $1 -eq 1 ]
    then
        echo 1
    else
        local temp=$(( $1 - 1 ))
        local result=$(factorial $temp)
        echo $(( $result * $1 ))
    fi
}
read -p "Enter value: " value
result=$(factorial $value)
echo "The factorial of $value is: $result"

echo ------------------------------------

# Подключение библиотек

echo Подключение библиотек

. ./myfuncs
#source ./myfuncs
result=$(addnum 10 20)
echo "The result is: $result"
