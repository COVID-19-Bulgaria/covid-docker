FROM python:3.8-slim-buster as builder

MAINTAINER Veselin Stoyanov "veselin@coronavirus-bulgaria.com"

# Install Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
						                                         gfortran \
						                                         libatlas-base-dev \
						                                         libjpeg-dev \
						                                         libxml2-dev \
						                                         libfreetype6-dev \
						                                         libpng-dev

RUN pip install --no-cache-dir --user numpy pandas matplotlib seaborn pydlm epyestim

FROM python:3.8-slim-buster as runtime

MAINTAINER Veselin Stoyanov "veselin@coronavirus-bulgaria.com"

# Use python dependencies from builder stage
COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

# Install Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends git \
						                                         openssh-client \
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
ADD scripts/entrypoint.sh /scripts/entrypoint.sh

# Set working directory
ENV COVID_STATS_PATH_CONTAINER /usr/src/covid-stats
WORKDIR $COVID_STATS_PATH_CONTAINER

RUN pip install --no-cache-dir git+https://github.com/COVID-19-Bulgaria/covid-stats.git@master

ENTRYPOINT ["/scripts/entrypoint.sh"]
