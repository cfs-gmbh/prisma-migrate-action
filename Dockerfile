# Container image that runs your code
FROM node:14-alpine AS base


RUN /bin/sh -c "apk add --no-cache bash"
RUN yarn global add prisma

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]