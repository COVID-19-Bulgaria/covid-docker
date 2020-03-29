ARG RUBY_VERSION

FROM ruby:${RUBY_VERSION}-alpine

MAINTAINER Veselin Stoyanov "veselin@coronavirus-bulgaria.com"

# Install Software
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                openssh \
                                tzdata \
                                postgresql-dev

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
ADD scripts/start_application.sh /scripts/start_application.sh
ADD scripts/entrypoint.sh /scripts/entrypoint.sh

# Application

ENV COVID_SCRAPER_CODE_PATH_CONTAINER /usr/src/covid-scraper
WORKDIR $COVID_SCRAPER_CODE_PATH_CONTAINER

RUN gem install bundler

ENTRYPOINT ["/scripts/entrypoint.sh"]
