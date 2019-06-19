# Setting the base to nodejs 8.11.1
FROM node:8.16.0-alpine@sha256:f457c62e5dabdd52bab39f2f2b426e32dbd7345d7c23059b53e0efa1a1826092

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