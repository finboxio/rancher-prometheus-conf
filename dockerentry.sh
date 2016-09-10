#!/bin/sh

cp /run.sh /opt/rancher/bin/

if [[ "$EBS_VOLUME_NAME" != "" ]]; then
  ebs-volume-setup
fi

exec /confd $@
