FROM r-base

MAINTAINER Veselin Stoyanov "veselin@coronavirus-bulgaria.com"

# Install Dependencies
RUN sed -i -e's/ main/ main contrib/g' /etc/apt/sources.list \
	&& apt-get update \
	&& echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections \
	&& apt-get install -y git libcurl4-openssl-dev libudunits2-dev libgdal-dev libgeos-dev libproj-dev libfontconfig1-dev ttf-mscorefonts-installer

RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_github('COVID-19-Bulgaria/covid-stats')"

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
ADD scripts/entrypoint.sh /scripts/entrypoint.sh

# Set working directory
ENV COVID_STATS_PATH_CONTAINER /usr/src/covid-stats
WORKDIR $COVID_STATS_PATH_CONTAINER

ENTRYPOINT ["/scripts/entrypoint.sh"]
