FROM node:latest

RUN git clone https://github.com/MichaelMarkieta/ng2-admin.git /var/www
WORKDIR /var/www
RUN npm install --global rimraf
RUN npm run clean
RUN npm install --global webpack webpack-dev-server typescript@beta
RUN npm install
RUN npm run prebuild:prod && npm run build:prod

EXPOSE 8080
EXPOSE 80

ENTRYPOINT ["npm", "run", "server:prod"]
