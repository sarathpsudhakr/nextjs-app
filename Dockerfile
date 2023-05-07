# Stage 1: Build Next.js application
FROM node:18-alpine as build

COPY . /usr/local/app/

WORKDIR /usr/local/app

RUN npm install

# Stage 2: Run Next.js application with NGINX
FROM nginx:1.21-alpine

# Copy NGINX configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Remove default NGINX static content
RUN rm -rf /usr/share/nginx/html/*

# Expose port
EXPOSE 80 3000

# Start Next.js application and NGINX
CMD ["sh", "-c", "cd /usr/local/app && npm run dev & nginx -g 'daemon off;'"]
