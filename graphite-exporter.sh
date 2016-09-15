#! /bin/sh

while [[ ! -e /etc/rancher-conf/graphite-remapper.conf ]]; do
  echo "Waiting for graphite mapping..."
  sleep 2
done

exec /bin/graphite_exporter \
  -graphite.mapping-config=/etc/rancher-conf/graphite-remapper.conf \
  -graphite.mapping-strict-match
