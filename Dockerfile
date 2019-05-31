# Setting the base to nodejs 8.11.1
FROM node:8.16.0-alpine@sha256:47e18adcfe5e72bcf0a72f868b01cfd0a006084a2c23851f203f46e46529d2dd

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