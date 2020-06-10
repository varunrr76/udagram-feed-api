# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Installing the aws cli

# download the aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzipping the file
RUN unzip awscliv2.zip

# Installing the aws cli
RUN ./aws/install -i /usr/local/aws-cli -b /usr/local/bin

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