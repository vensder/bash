#!/bin/bash

SWAPDIR=/data
SWAPSIZE=1G
SWAPFILE=$SWAPSIZE.swap

fallocate -l $SWAPSIZE $SWAPDIR/$SWAPFILE
mkswap $SWAPDIR/$SWAPFILE
chmod 0600 $SWAPDIR/$SWAPFILE
swapon $SWAPDIR/$SWAPFILE

#check
swapon -s
free

