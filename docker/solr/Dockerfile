FROM solr:8.11.1

EXPOSE 8983

ENV SOLR_DIR="/opt/solr/server"
ENV SOLR_CONFIG_DIR="$SOLR_DIR/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/ckan/conf/managed-schema"
ENV SOLR_CONFIGSETS="$SOLR_DIR/solr/configsets/"
USER root

# Create a CKAN configset by copying the default one
RUN cp -R $SOLR_CONFIG_DIR/_default $SOLR_CONFIG_DIR/ckan

# Update the schema
ADD configsets/currency.xml \
configsets/synonyms.txt \
configsets/stopwords.txt \
configsets/protwords.txt \
configsets/elevate.xml \
$SOLR_CONFIGSETS

ADD ./schema.solr8.xml $SOLR_SCHEMA_FILE
RUN chmod 644 $SOLR_SCHEMA_FILE 

VOLUME ${SOLR_DIR} 

USER solr

CMD ["sh", "-c", "solr-precreate ckan $SOLR_CONFIG_DIR/ckan"]
