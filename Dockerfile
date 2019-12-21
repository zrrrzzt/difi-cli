# Setting the base to nodejs 8.11.1
FROM node:8.17.0-alpine@sha256:4d3394c977233dd6d0a6ae2e7d4c5f88e54deb81280f2ea3a55cca3b3b4a0c4c

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