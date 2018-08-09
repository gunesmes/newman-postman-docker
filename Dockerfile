FROM node:6.5.0-slim

RUN npm install newman
RUN npm install -g newman-reporter-html

WORKDIR /usr/src/app/

ENTRYPOINT ["/node_modules/.bin/newman"]