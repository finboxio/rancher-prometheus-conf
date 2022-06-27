FROM finboxio/rancher-conf-aws:v1.3.6

RUN apk add --no-cache docker

VOLUME /etc/rancher-conf/prometheus

ADD config.toml /etc/rancher-conf/
ADD prometheus.yml.tmpl /etc/rancher-conf/
ADD reload.sh /etc/rancher-conf/
