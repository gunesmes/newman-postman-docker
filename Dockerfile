FROM node:6.5.0-slim

RUN npm install newman
RUN npm install newman-reporter-html
RUN npm install newman-reporter-json-summary
RUN npm install newman-reporter-htmlextra


RUN mkdir /newman
WORKDIR /newman

EXPOSE 9000

ENTRYPOINT ["/node_modules/.bin/newman"]
