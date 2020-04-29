FROM buildpack-deps:jessie-curl
USER root
RUN set -x \
    && curl -sL https://deb.nodesource.com/setup_14.x| bash - \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list \
    && apt-get update \
	&& apt-get install -y wget nodejs xvfb google-chrome-stable bzip2 curl python python-dev python-setuptools build-essential libssl-dev libffi-dev unzip python-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && pip install ansible boto boto3 awscli \
    && apt-get install npm \
    && npm install -g @angular/cli --unsafe-perm \
    && npm install -g istanbul \
    && npm install -g jasmine-node \
    && npm install -g jasmine-core@* \
    && npm install -g karma \
    && npm install -g karma-coverage-istanbul-reporter \
    && npm install -g karma-jasmine-html-reporter \
    && npm install -g karma-chrome-launcher \
    && npm install -g karma-jasmine \
    && npm install -g typescript
ENV CHROME_BIN /usr/bin/google-chrome \
ADD scripts/xvfb-chrome /usr/bin/xvfb-chrome \
RUN ln -sf /usr/bin/xvfb-chrome /usr/bin/google-chrome
