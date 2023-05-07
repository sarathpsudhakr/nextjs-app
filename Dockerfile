FROM nginx:stable

COPY . /usr/local/app/

WORKDIR /usr/local/app

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN curl -fsSL https://deb.nodesource.com/setup_18.x && apt-get install -y nodejs

RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]

