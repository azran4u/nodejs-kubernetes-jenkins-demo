FROM node:12-alpine
# FROM node:alpine
COPY . .
# WORKDIR dist
# RUN apk add curl
# RUN apk add tshark
# CMD npm run cloud && sleep infinity
# CMD sleep infinity
CMD node dist/index.js
