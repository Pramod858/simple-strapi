# Use Node.js version 14.x.x (latest LTS)
FROM node:18.20.3

# Set environment variables
ENV NODE_ENV production
ENV APP_NAME my-strapi-app

# Create a directory to hold the application code inside the container
WORKDIR /usr/src/app

# Install Strapi globally (specify compatible version if needed)
RUN npm install strapi@latest -g

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Copy environment variables script and execute it
COPY generate_env_var.sh .
RUN chmod +x generate_env_var.sh
RUN ./generate_env_var.sh

# build app
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start Strapi
CMD ["npm", "start"]