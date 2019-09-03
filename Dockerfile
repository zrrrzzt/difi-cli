# Setting the base to nodejs 8.11.1
FROM node:8.16.0-alpine@sha256:a25886e4483bdb901c5096499716469c8df7d7a0d34c65204542fe6cb370fdc4

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