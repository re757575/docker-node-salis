#
# Node.js Dockerfile
#
# https://github.com/dockerfile/nodejs
#
FROM    dockerfile/nodejs

# Install app dependencies
COPY package.json /src/package.json
COPY bower.json /src/bower.json
RUN \
    cd /src && \
    npm install && \
    bower install

# Bundle app source
COPY . /src

# Define working directory.
WORKDIR /src

EXPOSE  1137

# Define default command.
CMD ["node", "/src/app.js"]
