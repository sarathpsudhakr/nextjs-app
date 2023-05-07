FROM node:18

COPY . /usr/local/app/

WORKDIR /usr/local/app

RUN apt update && apt install ngnix

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]

