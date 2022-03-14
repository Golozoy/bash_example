#!/bin/bash

# Глава 1: Начало

clear
echo "Начало"

echo "The current derectory is:"
pwd
echo "The user logged in is:"
whoami

echo ------------------------------------

# Использование системных переменных

echo Использование системных переменных
echo "Home for the current user is: $HOME"
echo "I have \$1 in my pocket"

echo ------------------------------------

# testig variables

echo testig variables

grade=5
person="Adam"
echo "$person is a good boy, he is in grade $grade"

echo ------------------------------------

# присвоение вывода команд переменным

echo присвоение вывода команд переменным

mydir=`pwd`
echo "The current derectory is: $mydir"
username=$(whoami)
echo "The user logged in is: $username"

echo ------------------------------------

#Мат операции

echo Мат операции

var1=$((5+5))
echo $var1
var2=$(($var1 * 2))
echo $var2

echo ------------------------------------

#if then

echo if then

user=root
if grep $user /etc/passwd
then
    echo "the user $user Exest"
fi

echo ------------------------------------

#if then else

echo if then else

user=toor
if grep $user /etc/passwd
then
    echo "the user $user Exest"
else
    echo "the user $user don't exest"
    
fi

echo ------------------------------------

# вложеные условия

echo вложеные условия

user=anotherUser
if grep $user /etc/passwd
then
    echo "The user $user Exists"
elif ls /home
then
    echo "The user doesn’t exist but anyway there is a directory under /home"
fi

echo ------------------------------------

# сравнения чисел
    #n1 -eq n2 Возвращает истинное значение, если n1 равно n2.
    #n1 -ge n2 Возвращает истинное значение, если n1 больше или равно n2.
    #n1 -gt n2 Возвращает истинное значение, если n1 больше n2.
    #n1 -le n2 Возвращает истинное значение, если n1 меньше или равно n2.
    #n1 -lt n2 Возвращает истинное значение, если n1 меньше n2.
    #n1 -ne n2 Возвращает истинное значение, если n1 не равно n2.

echo сравнения чисел

val1=6
if [ $val1 -gt 5 ]
then
    echo "The test value $value1 is greater than 5"
else
    echo "The test value $value1 is not greater than 5"
fi

echo ------------------------------------

# сравнения строк
    #str1 = str2 Проверяет строки на равенство, возвращает истину, если строки идентичны.
    #str1 != str2 Возвращает истину, если строки не идентичны.
    #str1 < str2 Возвращает истину, если str1 меньше, чем str2.
    #str1 > str2 Возвращает истину, если str1 больше, чем str2.
    #-n str1 Возвращает истину, если длина str1 больше нуля.
    #-z str1 Возвращает истину, если длина str1 равна нулю.

echo сравнения строк

val1="text"
val2="another text"
if [ $val1 \> "$val2" ]
then
    echo "$val1 is greater than $val2"
else
    echo "$val1 is less than $val2"
fi

echo ------------------------------------

# Проверка файлов
    #-d file Проверяет, существует ли файл, и является ли он директорией.
    #-e file Проверяет, существует ли файл.
    #-f file Проверяет, существует ли файл, и является ли он файлом.
    #-r file Проверяет, существует ли файл, и доступен ли он для чтения.
    #-s file Проверяет, существует ли файл, и не является ли он пустым.
    #-w file Проверяет, существует ли файл, и доступен ли он для записи.
    #-x file Проверяет, существует ли файл, и является ли он исполняемым.
    #file1 -nt file2 Проверяет, новее ли file1, чем file2.
    #file1 -ot file2 Проверяет, старше ли file1, чем file2.
    #-O file Проверяет, существует ли файл, и является ли его владельцем текущий пользователь.
    #-G file Проверяет, существует ли файл, и соответствует ли его идентификатор группы идентификатору группы текущего пользователя.
#!/bin/bash

echo Проверка файлов

mydir=/home/q
if [ -d $mydir ]
then
    echo "The $mydir directory exists"
    cd $mydir
    ls
else
    echo "The $mydir directory does not exist"
fi
