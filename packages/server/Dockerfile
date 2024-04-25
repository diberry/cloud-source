# API-TODO Dockerfile

# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container to /app
WORKDIR /app

# Bundle the application source inside the Docker image
COPY . .

# Install the application dependencies
RUN npm install

RUN npm run build

RUN ls -la dist

# If you are building your code for production
# RUN npm ci --only=production

# Install PM2 globally
RUN npm install pm2 -g

# Expose the application on port 3005
EXPOSE 3005

# Define the command to run the application using PM2
CMD [ "pm2-runtime", "start", "dist/start.js" ]