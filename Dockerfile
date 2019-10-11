# Setting the base to nodejs 8.11.1
FROM node:8.16.2-alpine@sha256:748663b62f6c7c48921b426696b9e5ceee6b1e61a0c2dd76570f3516c660b82c

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