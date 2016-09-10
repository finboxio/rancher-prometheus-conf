FROM alpine:3.4

ENV CONFD_VERSION 0.11.0
ENV EBS_SCRIPTS_VERSION 0.0.2

RUN apk add --no-cache curl bash xfsprogs groff less python py-pip && \
    curl -L -o /confd https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-amd64 && \
    chmod +x /confd && \
    curl -L -o /ebs.tar.gz https://github.com/finboxio/ebs-scripts/archive/v$EBS_SCRIPTS_VERSION.tar.gz && \
    tar xf /ebs.tar.gz && \
    mv /ebs-scripts-$EBS_SCRIPTS_VERSION/* /usr/sbin/ && \
    chmod +x /usr/sbin/ebs-* && \
    rm -rf /ebs.tar.gz && \
    curl -L -o /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    chmod +x /usr/bin/jq && \
    pip install awscli && \
    apk del --no-cache curl py-pip

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
ADD ./run.sh /run.sh
ADD ./dockerentry.sh /dockerentry.sh

VOLUME /data/confd
VOLUME /opt/rancher/bin
VOLUME /usr/share/elasticsearch/config

ENTRYPOINT ["/dockerentry.sh"]
CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
