# Setting the base to nodejs 8.11.1
FROM node:8.16.0-alpine@sha256:2d6ffd6ee67dcee6a6595805c903f411afdec773f935539b0752579818273eb8

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