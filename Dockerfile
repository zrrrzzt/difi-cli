###########################################################
#
# Dockerfile for difi-cli
#
###########################################################

# Setting the base to nodejs 4.6.1
FROM mhart/alpine-node:4.6.1@sha256:7cdb9fe36a9811d3c77c8c643b57b78fc21ac69c1e1ddda93ca785f82617fbbd

# Maintainer
MAINTAINER Geir Gåsodden

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