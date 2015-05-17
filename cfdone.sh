#!/bin/bash
IN_PROG=$(s3cmd cfinvalinfo cf://E2LNN0L3U2OVU | grep "Status:" | grep -c InProgress)
echo "Number of invalidations in progress: $IN_PROG"
if [ "$IN_PROG" -eq "0" ]
then
  exit 0
else
  exit 1
fi


