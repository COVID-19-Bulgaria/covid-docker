FROM python:3-alpine

MAINTAINER Veselin Stoyanov "veselin@coronavirus-bulgaria.com"

# Install Dependencies
RUN apk add --no-cache --update git \
                                openssh \
                                tzdata

# Set timezone
RUN cp /usr/share/zoneinfo/Europe/Sofia /etc/localtime

# SSH Configuration
RUN mkdir -p /root/.ssh
ADD ssh/id_rsa /root/.ssh/id_rsa
ADD ssh/id_rsa.pub /root/.ssh/id_rsa.pub

RUN chmod -R 400 /root/.ssh/id_rsa
RUN chmod -R 444 /root/.ssh/id_rsa.pub

RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

RUN git config --global user.email "hello@coronavirus-bulgaria.org"
RUN git config --global user.name "Deploy Bot"

# Scripts
RUN mkdir -p /scripts
ADD scripts/install_dependencies.sh /scripts/install_dependencies.sh
ADD scripts/entrypoint.sh /scripts/entrypoint.sh

# Set working directory
ENV COVID_STATS_PATH_CONTAINER /usr/src/covid-stats
WORKDIR $COVID_STATS_PATH_CONTAINER

ENTRYPOINT ["/scripts/entrypoint.sh"]
