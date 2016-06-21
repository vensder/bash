#!/bin/bash

#filename="$1"
filename="file.txt"
while read -r line
do
    
#    if [ "$line" == "problems" ]
#    then 
#        break
#    fi
#    echo "$line"
    
    for i in message1 message2 message3 message4
    do
        if [ "$line" == "problems" ]
        then 
            exit 0
        fi
        eval $(echo $i=$line)
        echo $i
        echo $(($i))
    done
done < "$filename"

#for i in {AUTH_KEY,SECURE_AUTH_KEY,LOGGED_IN_KEY,NONCE_KEY}
#do
#	y=$(pwgen -s 40 1)
#	eval $(echo $i=$y)
#done
