#!/bin/bash
GSUTIL="/usr/local/google-cloud-sdk/bin/gsutil"
m_file=`basename $1`
m_path=`dirname $1`
mv "$m_path/$m_file" "$m_path/DONE_$m_file"
chmod -R 777 $m_path/DONE_*
logger "sending files for $m_path/DONE_$m_file"
ssh -o stricthostkeychecking=no -o connecttimeout=2 pi@localhost "${GSUTIL} mv /var/lib/motion/DONE_* gs://`hostname`"
rc=$?
echo "sent files RC $rc"
logger "sent files RC $rc"
