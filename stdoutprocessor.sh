#!/bin/bash
echo "Start processing"

connected=0
echo $connected > /tmp/connected

while IFS= read -r line
do
    #echo line so that docker can gather its logs from stdout
    echo $line

    #message when a player is connected is like: [5a8bf70c][server]: player has entered the game. ClientID=1 addr=172.17.0.1:57587
    x=$(echo $line | grep 'has entered the game' | wc -l)
    toAdd=0
    if [ $x -eq 1 ]
    then
       toAdd=1
    fi
    
    #message when a player leaves is like [5a8bf70c][server]: '(1)nameless tee' has left the game
    y=$(echo $line | grep 'has left the game' | wc -l)
    if [ $y -eq 1 ]
    then
        toAdd=-1
    fi
    
    if [ $x -eq 1 ] || [ $y -eq 1 ]
    then
        #get current connected count from the file
        connected=$(</tmp/connected)
        #((..)) is the way for integer arithmetics on bash
        connected=$(($connected+$toAdd))
        echo $connected > /tmp/connected
    fi 
done

echo "Finished processing"
