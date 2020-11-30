#!/bin/bash

i3status | while :
do
    read line
    loc=`xset -q|grep Group\ 2|awk {'print $4'}|sed 's/on/ru/g;s/off/en/g'`
    #date_now=$(date  +%Y-%m-%d)
    # вывод времени
    #time_now=$(date  +%Y-%m-%d\ %H:%M:%S)
    #status_out=`i3status`
    echo "$loc | $line" | lolcat || exit 1
done
