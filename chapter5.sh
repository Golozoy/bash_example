#!/bin/bash

# Глава 5 Сигналы, фоновые задачи, управление сценариями

# Перехват сигналов

echo Перехват сигналов

trap "echo ' Trapped Ctrl-C'" SIGINT
echo This is a test script
count=1
while [ $count -le 5 ]
do
    echo "Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done

echo -------------------------------------

# Перехват сигнала выхода из скрипта

echo Перехват сигнала выхода из скрипта

trap "echo Goodbye.." EXIT
count=1
while [ $count -le 5 ]
do
    echo "Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done

echo -------------------------------------

# Модификация перехваченных сигналов и отмена перехвата

echo Модификация перехваченных сигналов и отмена перехвата

trap "echo 'Ctrl-C is trapped.'" SIGINT
count=1
while [ $count -le 5 ]
do
    echo "Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done
trap "echo ' I modified the trap!'" SIGINT
count=1
while [ $count -le 5 ]
do
    echo "Second Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done
trap -- SIGINT
echo "I just removed the trap"
count=1
while [ $count -le 5 ]
do
    echo "Third loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done

echo -------------------------------------
