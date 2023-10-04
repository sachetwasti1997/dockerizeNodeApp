# use this empty Dockerfile to build your assignment
FROM node:6-alpine

RUN apk add --no-cache tini

WORKDIR /usr/src/app

COPY . .
# - Copy everything from the current directory on host to current working directory 
# - in Image

RUN npm install\
    && npm cache clean --force

EXPOSE 3000
# expose these ports in the docker virtual network
# still need to use -p or -P to open/forward these ports on the host

CMD [ "tini", "--", "node", "./bin/www" ]
# run this command when the container is launched
# only one CMD allowed, so if there are multiple last one is executed

# NOTE: The instructions are now in the README.md file in this directory.
