#!/bin/bash

# clone repository
git clone https://github.com/nodejs/examples
cd examples/servers/express/api-with-express-and-handlebars/

# create Dockerfile for this specific application using the node:latest base
cat > Dockerfile << EOF
FROM node:latest
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "node", "index.js"]%
EOF

# build the image
docker build -t anfabio/aptoide-challenge .

# upload image to repository
read -s -p "Docker Hub User: " user
read -s -p "Docker Hub Password: " pass
docker login -u "$user" -p "$pass"
docker push "$user"/aptoide-challenge