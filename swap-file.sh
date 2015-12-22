#!/bin/bash

SWAPDIR=/home/ci/swap
SWAPSIZE=4G
SWAPFILE=$SWAPSIZE.swap

if [ ! -f $SWAPDIR/$SWAPFILE ]; then
  mkdir -p $SWAPDIR
  fallocate -l $SWAPSIZE $SWAPDIR/$SWAPFILE
  mkswap $SWAPDIR/$SWAPFILE
  chmod 0600 $SWAPDIR/$SWAPFILE
fi

swapon -s | grep $SWAPDIR/$SWAPFILE
if [ $? -ne 0 ]
then
    swapon $SWAPDIR/$SWAPFILE
fi

#check
swapon -s
free

