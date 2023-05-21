# Pull NGINX stable image from Docker hub
FROM node:18-alpine

# Create the folder and copy application files to the folder
COPY . /usr/local/app/ 

# Define the working directory
WORKDIR /usr/local/app

# Install vim editor, top, iftop
RUN apt-get update && apt-get install -y vim procps iftop

# Install npm dependencies
RUN npm install

# Expose port
EXPOSE 3000

# Start Nextjs application
CMD ["npm", "run", "dev"]
