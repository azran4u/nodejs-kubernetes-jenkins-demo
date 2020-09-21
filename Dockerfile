FROM node:12-alpine
# FROM node:alpine
COPY /dist .
WORKDIR dist
# RUN apk add curl
# RUN apk add tshark
# CMD npm run cloud && sleep infinity
# CMD sleep infinity
CMD node index.js
