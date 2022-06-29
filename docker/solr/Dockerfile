FROM solr:8.11.1

EXPOSE 8983

ENV SOLR_DIR="/opt/solr/server"
ENV SOLR_CONFIG_DIR="$SOLR_DIR/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/ckan/conf/managed-schema"
ENV SOLR_CONFIGSETS="$SOLR_DIR/solr/configsets/"
USER root

RUN apt-get -q -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade \
    && apt-get -q -y install \
            sudo \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

# Create a CKAN configset by copying the default one

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER solr

CMD ["sh", "-c", "solr-precreate ckan $SOLR_CONFIG_DIR/ckan"]
