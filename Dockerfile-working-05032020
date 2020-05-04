FROM debian:latest 
USER root

RUN set -x \
    && apt-get update \
    && apt-get install  -y curl wget  python python-dev python-setuptools unzip python-pip python3-pip \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get -y install nodejs \
    && pip install ansible boto boto3 awscli \ 
    && apt-get install -y xvfb google-chrome-stable bzip2 curl python python-dev python-setuptools \
    && pip install ansible boto boto3 awscli \
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
