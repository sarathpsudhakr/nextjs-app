FROM node:18-alpine

# Create the folder and copy application files to the folder
COPY . /usr/local/app/ 

# Define the working directory
WORKDIR /usr/local/app

RUN apk update && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN npm install

RUN nohup npm run dev &

EXPOSE 3000

CMD ["ngnix", "-g", "daemon off"]
