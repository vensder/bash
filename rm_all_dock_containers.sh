#!/bin/bash

### rm all docker containers
for f in $(sudo docker ps -a | grep -v 'CONTAINER' | awk '{ print $1 }'); 
    do echo "rm $f";
    sudo docker rm $f; 
done;
