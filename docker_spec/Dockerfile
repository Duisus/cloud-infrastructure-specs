FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./
COPY YandexInternalRootCA.crt ./

RUN npm install
COPY . .

ENV NODE_ENV=production

EXPOSE 80
CMD [ "node", "server/app.js" ]
