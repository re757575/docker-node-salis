#
# https://hub.docker.com/r/library/node/
#
FROM node:slim

# Install app dependencies
COPY package.json /src/package.json
COPY bower.json /src/bower.json
RUN \
    cd /src && \
    npm install && \
    npm install -g bower && \
    bower install --allow-root

# Bundle app source
COPY . /src

# Define working directory.
WORKDIR /src

EXPOSE  1137

# Define default command.
CMD ["node", "/src/app.js"]
