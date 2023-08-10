# Use the official Node.js LTS image as the base image
FROM node:18 as builder

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application source code to the container
COPY . .

# Build the Angular app for production
RUN npm run build --prod

# Use the official Nginx image as the base image to serve the app
FROM nginx:alpine

# Copy the built Angular app from the previous stage to Nginx's default public directory
COPY --from=builder /app/dist/angular-testapi /usr/share/nginx/html

# Expose the container's port 80
EXPOSE 8050

# Start Nginx to serve the app
CMD ["nginx", "-g", "daemon off;"]
