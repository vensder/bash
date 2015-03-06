#!/bin/bash

if [ `whoami` == 'root' ]; then echo 'You are root! We change user to current owner'; 

su vensder -c 'whoami';

fi

