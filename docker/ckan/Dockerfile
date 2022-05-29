# See CKAN docs on installation from Docker Compose on usage
FROM python:3.8

# Install required system packages
RUN apt-get -q -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade \
    && apt-get -q -y install \
        python3-dev \
        python3-pip \
        python3-venv \
        python3-wheel \
        net-tools \
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
        telnet \
        cron \
        sudo \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

# Define environment variables
ENV CKAN_HOME=/usr/lib/ckan
ENV CKAN_VENV=$CKAN_HOME/orsted-ckan
ENV CKAN_CONFIG=/etc/ckan
ENV CKAN_STORAGE_PATH=/var/lib/ckan
ENV CKAN_MSG_BACKUP=$CKAN_HOME/msg-backup
# Build-time variables specified by docker-compose.yml / .env
ENV CKAN_SITE_URL=http://localhost:5000

# Create ckan user
RUN useradd -r -u 900 -m -c "ckan account" -G sudo -d $CKAN_HOME -s /bin/false ckan
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setup virtual environment for CKAN
RUN mkdir -p $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH $CKAN_MSG_BACKUP && \
    python3 -m venv --system-site-packages $CKAN_VENV && \
    ln -s $CKAN_VENV/bin/pip3 /usr/local/bin/ckan-pip3 &&\
    ln -s $CKAN_VENV/bin/ckan /usr/local/bin/ckan

# Virtual environment binaries/scripts to be used first
ENV PATH $CKAN_VENV/bin:$PATH

COPY ckan-entrypoint.sh /
RUN chmod +x /ckan-entrypoint.sh

# Setup CKAN
ADD ckan-customizations/ $CKAN_HOME/orsted-scripts/
RUN . $CKAN_VENV/bin/activate && \
    ckan-pip3 install setuptools==44.1.0 && \
    ckan-pip3 install --upgrade pip && \
    ckan-pip3 install -e 'git+https://github.com/ckan/ckan.git@ckan-2.9.5#egg=ckan[requirements]' && \
    ckan-pip3 install --upgrade --no-cache-dir -e file:./$CKAN_HOME/orsted-scripts/src/ckanext-extrafields && \
    ckan-pip3 install --upgrade --no-cache-dir -e file:./$CKAN_HOME/orsted-scripts/src/ckanext-theme && \
    ckan-pip3 install --upgrade --no-cache-dir -r ./$CKAN_HOME/orsted-scripts/scripts/project_import/requirements/azure.txt && \
    chown -R ckan:ckan $CKAN_HOME $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH

WORKDIR $CKAN_VENV/
ENTRYPOINT ["/ckan-entrypoint.sh"]

COPY ./config/production.ini $CKAN_CONFIG/
COPY ./config/who.ini $CKAN_CONFIG/
COPY ./config/apache.wsgi $CKAN_CONFIG/

USER ckan
EXPOSE 5000

CMD ["ckan","-c","/etc/ckan/production.ini", "run", "--host", "0.0.0.0"]
