#!/bin/bash
# log-rotate-simplewallet.sh
# 59 23 * * * log-rotate-simplewallet.sh

DATE=`date +%F`
#2014-06-27
WORKDIR="/opt/bcn_payout/bytecoin-reserve"

# create dir if not exist
mkdir -p $WORKDIR/logs;
cp $WORKDIR/simplewallet.log $WORKDIR/logs/$DATE-simplewallet.log && >$WORKDIR/simplewallet.log;

SUFFIX=`date +%s%N`
#gzip --suffix=.suff.gz test.txt
gzip --suffix=.$SUFFIX.gz $WORKDIR/logs/$DATE-simplewallet.log;

exit 0;



