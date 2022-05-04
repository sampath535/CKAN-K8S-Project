# See CKAN docs on installation from Docker Compose on usage
FROM python:3.8-slim-buster
MAINTAINER Open Knowledge

# Install required system packages
RUN apt-get -q -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade \
    && apt-get -q -y install \
        python3-dev \
        python3-pip \
        python3-venv \
        python3-wheel \
        libpq-dev \
        libxml2-dev \
        libxslt-dev \
        libgeos-dev \
        libssl-dev \
        libffi-dev \
        postgresql-client \
        build-essential \
        git-core \
        vim \
        wget \
        curl \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

# Define environment variables
ENV CKAN_HOME=/usr/lib/ckan
ENV CKAN_VENV=$CKAN_HOME/default
ENV CKAN_CONFIG=/etc/ckan
ENV CKAN_STORAGE_PATH=/var/lib/ckan

# Build-time variables specified by docker-compose.yml / .env
ENV CKAN_SITE_URL=http://localhost:5000

# Create ckan user
RUN useradd -r -u 900 -m -c "ckan account" -d $CKAN_HOME -s /bin/false ckan

# Setup virtual environment for CKAN
RUN mkdir -p $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH && \
    python3 -m venv --system-site-packages $CKAN_VENV && \
    ln -s $CKAN_VENV/bin/pip3 /usr/local/bin/ckan-pip3 &&\
    ln -s $CKAN_VENV/bin/ckan /usr/local/bin/ckan

# Virtual environment binaries/scripts to be used first
ENV PATH $CKAN_VENV/bin:$PATH

# Setup CKAN
ADD odl-ckan-source/ $CKAN_VENV/src/ckan/
ADD ckan-customizations/ $CKAN_VENV/src/ckan/ckan-customizations/
RUN . $CKAN_VENV/bin/activate && \
    ckan-pip3 install -U pip && \
    ckan-pip3 install --upgrade --no-cache-dir -r $CKAN_VENV/src/ckan/requirement-setuptools.txt && \
    ckan-pip3 install --upgrade --no-cache-dir -r $CKAN_VENV/src/ckan/requirements.txt && \
    ckan-pip3 install --upgrade --no-cache-dir -e file:./$CKAN_VENV/src/ckan/ckan-customizations/src/ckanext-extrafields && \
    ckan-pip3 install --upgrade --no-cache-dir -e file:./$CKAN_VENV/src/ckan/ckan-customizations/src/ckanext-theme && \
    ckan-pip3 install -e $CKAN_VENV/src/ckan/ && \
    cp -v $CKAN_VENV/src/ckan/contrib/docker/ckan-entrypoint.sh /ckan-entrypoint.sh && \
    chmod +x /ckan-entrypoint.sh && \
    chown -R ckan:ckan $CKAN_HOME $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH


WORKDIR $CKAN_VENV/src/ckan/

ENTRYPOINT ["/ckan-entrypoint.sh"]
COPY ./config/production.ini $CKAN_CONFIG/
COPY ./config/who.ini $CKAN_CONFIG/
COPY ./config/apache.wsgi $CKAN_CONFIG/

USER ckan
EXPOSE 5000

# RUN . $CKAN_VENV/bin/activate && python3 $CKAN_VENV/src/ckan/ckan-customizations/src/ckanext-extrafields/setup.py develop
# RUN . $CKAN_VENV/bin/activate && python3 $CKAN_VENV/src/ckan/ckan-customizations/src/ckanext-theme/setup.py develop

CMD ["ckan","-c","/etc/ckan/production.ini", "run", "--host", "0.0.0.0"]
