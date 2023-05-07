FROM nginx:stable

COPY . /usr/local/app/

WORKDIR /usr/local/app

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN apt update && apt install nodejs npm -y

RUN npm install

RUN nohup npm run dev

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]

