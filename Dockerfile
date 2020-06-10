# Use NodeJS base image
FROM node:13

# Installing the aws cli to configure a profile

# Download the cli zip file
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the file
RUN unzip awscliv2.zip

# Install the aws cli
RUN sudo ./aws/install

# Confirm installation
RUN aws --version

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime
RUN npm build 