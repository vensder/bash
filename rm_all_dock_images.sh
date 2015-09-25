#/bin/bash

for f in $(sudo docker images | grep -v 'REPOSITORY' | awk '{ print $1 }');
do echo "rm $f";
    sudo docker rmi $f;
done;
