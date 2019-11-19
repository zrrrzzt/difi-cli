# Setting the base to nodejs 8.11.1
FROM node:8.16.2-alpine@sha256:e820bbb6174b672a8eaf3c08aea105f0e436e4f85f46d973271b0cf73084deb5

#### Begin setup ####

# Installs git
RUN apk add --update git && rm -rf /var/cache/apk/*

# Bundle app source
COPY . /src

# Change working directory
WORKDIR "/src"

# Install dependencies
RUN npm install --production

# Startup
ENTRYPOINT node cli.js --dataset=$DATASET --query=$QUERY --format=$FORMAT