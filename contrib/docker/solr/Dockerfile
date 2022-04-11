FROM solr:8

EXPOSE 8983

ENV SOLR_CONFIG_DIR="/opt/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/ckan/conf/managed-schema"

USER root

# Create a CKAN configset by copying the default one
RUN cp -R $SOLR_CONFIG_DIR/_default $SOLR_CONFIG_DIR/ckan

# Update the schema
ADD https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.1/solr/server/solr/configsets/sample_techproducts_configs/conf/currency.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.1/solr/server/solr/configsets/_default/conf/synonyms.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.1/solr/server/solr/configsets/_default/conf/stopwords.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.1/solr/server/solr/configsets/_default/conf/protwords.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/8.11.1/solr/server/solr/configsets/sample_techproducts_configs/conf/elevate.xml \
$SOLR_CONFIG_DIR

ADD ./ckan/config/solr/schema.solr8.xml $SOLR_SCHEMA_FILE
RUN chmod 644 $SOLR_SCHEMA_FILE 

USER solr

CMD ["sh", "-c", "solr-precreate ckan $SOLR_CONFIG_DIR/ckan"]
