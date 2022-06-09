FROM node:16
WORKDIR /usr/src/app
COPY $APP_FOLDER package*.json ./
RUN npm install
COPY $APP_FOLDER/. .
EXPOSE 3000
CMD [ "node", "server.js" ]
