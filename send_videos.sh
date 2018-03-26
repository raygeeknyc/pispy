#!/bin/bash
GSUTIL="/usr/local/google-cloud-sdk/bin/gsutil"
m_file=`basename $1`
m_path=`dirname $1`
mv "$m_path/$m_file" "$m_path/DONE_$m_file"
chmod -R 777 $m_path/DONE_*
logger "sending files for $m_path/DONE_$m_file"
su - pi -c "${GSUTIL} mv /var/lib/motion/DONE_* gs://laboratory/ >/tmp/`basename $0`.out 2>&1"
logger "sent files RC $?"
