#!/bin/bash
service=$1

if [ -z "$service" ]; then
    echo "Usage: scr <screen_name>"
    exit 2
fi

pattern="^$service$"
exist=$(screen -list | egrep '(Attached|Detached)' | awk '{print $1;}' | sed -r 's/[0-9]+\.//' | grep $pattern)

if [ -z "$exist" ]
then
    echo "start screen $service"
    screen -S $service
else
    echo "reattach screen $service"
    screen -rx $service
fi
