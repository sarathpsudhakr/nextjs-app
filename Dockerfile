FROM nginx:stable

COPY . /usr/local/app/

WORKDIR /usr/local/app

RUN rm -rf /etc/nginx/conf.d/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY  ./.next /usr/share/nginx/html

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]

