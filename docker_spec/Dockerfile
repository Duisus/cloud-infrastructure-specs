FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./
COPY YandexInternalRootCA.crt ./

RUN npm install
COPY . .

EXPOSE 8080
CMD [ "node", "server/app.js" ]
