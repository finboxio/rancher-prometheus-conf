FROM finboxio/rancher-conf-aws:dev

ADD config.toml /etc/rancher-conf/
ADD prometheus.yml.tmpl /etc/rancher-conf/
ADD reload.sh.tmpl /etc/rancher-conf/
ADD graphite-remapper.conf /etc/rancher-conf/
ADD run.sh /opt/rancher/bin/
ADD graphite-exporter.sh /opt/rancher/bin/
