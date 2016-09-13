#!/bin/sh

PROMETHEUS_DATA_DIR=${PROMETHEUS_DATA_DIR:?"PROMETHEUS_DATA_DIR must be set"}

while [[ ! -e /etc/rancher-conf/prometheus.yml ]]; do
  echo "Waiting for prometheus conf..."
  sleep 2
done

mkdir -p ${PROMETHEUS_DATA_DIR}

prometheus \
  -config.file=/etc/rancher-conf/prometheus.yml \
  -storage.local.path=${PROMETHEUS_DATA_DIR} \
  -web.console.libraries=/etc/prometheus/console_libraries \
  -web.console.templates=/etc/prometheus/consoles
