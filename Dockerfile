# Setting the base to nodejs 8.11.1
FROM node:8.16.0-alpine@sha256:15ac3cbf6c860d0edf043b05d12500c1e21a6b53ca68298eccb2ada0a81359c6

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