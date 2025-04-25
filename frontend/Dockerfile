# # frontend/Dockerfile
# FROM node:20

# WORKDIR /app

# COPY package*.json ./
# RUN npm install --include=dev

# COPY . .

# # Expose Vite dev server port (default is 5173)
# EXPOSE 5173

# CMD ["npm", "run", "dev"]


# # frontend/Dockerfile - TRY 1 - PRODUCTION
# FROM node:20

# WORKDIR /app

# COPY package*.json ./
# RUN npm install --only=production

# COPY . .

# # Expose the port if you're serving the app with a server like Nginx
# EXPOSE 5173

# # Run production build (do not use dev server)
# CMD ["npm", "run", "build"]



# # Use Node to build the app - TRY 2 - PRODUCTION
# FROM node:20

# # Set working directory
# WORKDIR /app

# # Install dependencies
# COPY package*.json ./
# RUN npm install

# # Copy the rest of your code and build with Vite
# COPY . .
# RUN npm run build

# # Install Nginx
# RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# # Remove default nginx site and replace with your Vite build
# RUN rm -rf /var/www/html && cp -r dist /var/www/html

# # Copy your own nginx config
# COPY nginx.conf /etc/nginx/nginx.conf

# # Copy SSL certificates (you should have these already)
# # You should replace these paths with the location of your certificates
# COPY ./path/to/ssl/certificate.crt /etc/ssl/certs/
# COPY ./path/to/ssl/private.key /etc/ssl/private/

# # Expose the HTTPS port
# EXPOSE 443

# # Start Nginx
# CMD ["nginx", "-g", "daemon off;"]



# Use Node to build the app
FROM node:20

# Suppress interactive prompts from apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /app

# Install dependencies and build the app using a script
COPY package*.json ./

RUN npm install

COPY . ./

# Copy the build script and give it execute permissions
COPY my-frontend.sh /app/my-frontend.sh
RUN chmod +x /app/my-frontend.sh

# Install Nginx with non-interactive config handling
RUN apt-get update && \
    apt-get install -y --no-install-recommends --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-confold" nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy Certificate and Key and Nginx config file
COPY ./ssl/public_certificate.crt /etc/ssl/certs/
COPY ./ssl/private.key /etc/ssl/private/
COPY ./nginx.conf /etc/nginx/nginx.conf

# Give read permissions for Certificate, Key and Nginx config file
RUN chmod +r /etc/ssl/certs/
RUN chmod +r /etc/ssl/private/
RUN chmod +r /etc/nginx/nginx.conf

# Expose the HTTPS port
EXPOSE 443

# Start Nginx using the script
CMD ["/app/my-frontend.sh"]