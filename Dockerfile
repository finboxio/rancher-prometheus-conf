FROM finboxio/rancher-conf-aws

RUN apk add --no-cache docker

ADD https://github.com/bronze1man/yaml2json/raw/master/builds/linux_amd64/yaml2json /usr/sbin/yaml2json
RUN chmod +x /usr/sbin/yaml2json

ADD config.toml /etc/rancher-conf/
ADD prometheus.yml.tmpl /etc/rancher-conf/
ADD reload.sh.tmpl /etc/rancher-conf/
ADD graphite-remapper.conf /etc/rancher-conf/
ADD run.sh /opt/rancher/bin/
ADD graphite-exporter.sh /opt/rancher/bin/
