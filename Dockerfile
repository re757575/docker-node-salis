#
# https://hub.docker.com/r/library/node/
# https://hub.docker.com/r/re757575/docker-node-salis/
FROM node:slim

RUN mkdir /src

# Install git vim curl
RUN apt-get update && \
    apt-get install -y git vim curl && \
    git config --global url.https://.insteadOf git://

# Install app dependencies
ADD  package.json /src/package.json
ADD  bower.json /src/bower.json
RUN \
    cd /src && \
    npm install && \
    npm install -g bower && \
    bower install --allow-root

# Bundle app source
ADD . /src

# Define working directory.
WORKDIR /src

EXPOSE  1137

# Define default command.
CMD ["node", "/src/app.js"]
