# Setting the base to nodejs 8.11.1
FROM node:8.16.1-alpine@sha256:4201be67ca08fbd095790ea514766ec96ef1debd73b9858922d47862ccd242e2

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