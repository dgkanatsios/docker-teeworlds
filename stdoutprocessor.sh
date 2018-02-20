#!/bin/bash
echo "Start processing"

connected=0
echo $connected > /tmp/connected

while IFS= read -r line
do
    #echo line so that docker can gather its logs from stdout
    echo $line

    x=$(echo $line | grep 'has entered the game' | wc -l)
    toAdd=0
    if [ $x -eq 1 ]
    then
       toAdd=1
    fi
    
    y=$(echo $line | grep 'has left the game' | wc -l)
    if [ $y -eq 1 ]
    then
        toAdd=-1
    fi
    
    if [ $x -eq 1 ] || [ $y -eq 1 ]
    then
        #get value from the file
        connected=$(</tmp/connected)
        connected=$(($connected+$toAdd))
        echo $connected > /tmp/connected
    fi 
done

echo "Finished processing"
