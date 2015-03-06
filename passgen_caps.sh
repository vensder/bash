#!/bin/bash

LEN=$1;
# дефолтная длина пароля, если не передана параметром в скрипт
if [[ $LEN -eq "" ]]; then LEN=12; fi;

< /dev/urandom tr -dc A-Z0-9 | head -c${1:-$LEN};echo;

