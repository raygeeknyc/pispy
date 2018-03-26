#!/bin/bash
logger "$0 `whoami`"
ping -c 1 -W 1 www.google.com
if [[ $? -ne 0 ]];then
  logger "no internet, not sending files"
  echo "no internet, not sending files" >2
  exit -1
fi
`dirname $0`/send_to_gcs.sh "$1" >/tmp/`basename $0`.out 2>&1
