FROM node:latest

WORKDIR /code

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/NielsdeG/webshop-frontend.git /code

RUN npm install -g npm@9.6.2

RUN rm /code/package-lock.json

COPY  environment.ts /code/src/environments/environment.ts

RUN npm install

RUN npm install -g @angular/cli

CMD {"npm", "start"]
# usae port 4200
