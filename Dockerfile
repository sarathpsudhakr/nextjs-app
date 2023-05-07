FROM node:18-alpine

COPY . /usr/local/app/

WORKDIR /usr/local/app

RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]
