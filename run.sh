#!/bin/bash

set -e

PLUGIN_TXT=${PLUGIN_TXT:-/usr/share/elasticsearch/plugins.txt}

while [ ! -f "/usr/share/elasticsearch/config/elasticsearch.yml" ]; do
    sleep 1
done

if [ -f "$PLUGIN_TXT" ]; then
    for plugin in $(<"${PLUGIN_TXT}"); do
        /usr/share/elasticsearch/bin/plugin --install $plugin
    done
fi

datadir=$(cat /usr/share/elasticsearch/config/elasticsearch.yml | grep path.data | awk -F: '{ print $2 }')
if [[ "$datadir" != "" ]]; then
  mkdir -p $datadir &>/dev/null
  chown -R elasticsearch:elasticsearch $datadir
fi

mkdir -p /usr/share/elasticsearch/config/scripts
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config

exec /docker-entrypoint.sh elasticsearch
