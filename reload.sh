#!/bin/sh

echo 'reloading...'

chown -R 65534:65534 /etc/rancher-conf/prometheus

deployment=$(docker inspect $HOSTNAME | jq -r '.[0].Config.Labels["io.rancher.service.deployment.unit"]')
container=$(docker ps -q | \
  xargs docker inspect \
  | jq -r '.[] | select(.Config.Labels["io.rancher.service.deployment.unit"] == "'$deployment'") | .Id' \
  | grep -v $HOSTNAME)

if [[ "$container" != "" ]]; then
  docker kill --signal=SIGHUP $container
fi
