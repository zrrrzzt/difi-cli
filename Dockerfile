# Setting the base to nodejs 8.11.1
FROM node:8.16.0-alpine@sha256:a4353d6824c5155c535982ed0c375c4429fbdb2b74cf74c1c886841b820ea81d

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