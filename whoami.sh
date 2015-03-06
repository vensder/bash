#!/bin/bash

if [ `whoami` == 'root' ]; then echo 'You are root! Use su(do) for change user'; exit 0; fi

ls -la;

