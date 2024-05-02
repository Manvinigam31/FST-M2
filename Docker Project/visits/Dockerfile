# Specify a base image
FROM node:18-alpine

# Create the working directory
WORKDIR /usr/app

# Create package json to container
COPY package.json ./

# Install required dependencies
RUN npm install

# copy other files
COPY ./ ./

# Start the NodeJS server
CMD ["npm" , "start"]