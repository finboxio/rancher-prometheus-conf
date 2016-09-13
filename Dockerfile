FROM finboxio/rancher-conf-aws:dev

ADD config.toml /etc/rancher-conf/
ADD prometheus.yml.tmpl /etc/rancher-conf/
ADD reload.sh.tmpl /etc/rancher-conf/
ADD run.sh /opt/rancher/bin/
