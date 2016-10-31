FROM ubuntu:xenial
MAINTAINER d3viant0ne <wiens.joshua@gmail.com>

ENV APP_ENV production

# Debian Configuration
# ...
# Configure Install Environment
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# ...
# Run updates and install deps
RUN apt-get update --fix-missing

# Install needed deps and clean up after
RUN apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    libssl-dev \
    curl \
    g++ \
    gcc \
    git \
    make \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoclean

# NodeJS Configuration
# ...
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.6.0

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Set up our PATH correctly so we don't have to long-reference npm, node, &c.
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install pm2 *globally* so we can run our application
RUN npm i -g pm2

# Set environment variables
RUN mkdir -p /var/www/app/current
ENV appDir /var/www/app/current

COPY package.json /var/www/app/current

WORKDIR ${appDir}
RUN npm i --production

# Copy production build files
# ...
COPY ./dist /var/www/app/current

# PM2 Configuration
# ...
#COPY ./.docker/${APP_ENV}/pm2/processes.json /var/www/app/current
COPY ./process.yml /var/www/app/current

# ENV KEYMETRICS_SECRET
# ENV KEYMETRICS_PUBLIC
# ENV INSTANCE_NAME ""

#Expose the ports
EXPOSE 80 443 5000 43554

#CMD ["pm2", "start", "processes.json", "--no-daemon"]
CMD ["pm2-docker", "start", "--auto-exit", "--env", "production", "process.yml"]
