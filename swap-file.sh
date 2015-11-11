#!/bin/bash

SWAPDIR=/swap
SWAPSIZE=1G
SWAPFILE=$SWAPSIZE.swap

mkdir -p $SWAPDIR
fallocate -l $SWAPSIZE $SWAPDIR/$SWAPFILE
mkswap $SWAPDIR/$SWAPFILE
chmod 0600 $SWAPDIR/$SWAPFILE
swapon $SWAPDIR/$SWAPFILE

#check
swapon -s
free

