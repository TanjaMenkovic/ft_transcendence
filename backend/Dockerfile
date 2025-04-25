# # backend/Dockerfile
# FROM node:18

# WORKDIR /app

# # Install ts-node-dev globally (or use npx if preferred)
# RUN npm install -g ts-node-dev

# COPY package*.json ./
# RUN npm install --include=dev

# COPY . .

# # Expose backend port
# EXPOSE 8080

# # Run dev script
# CMD ["npm", "run", "dev"]



# TRY 1 / for Production 

# # backend/Dockerfile
# FROM node:18

# # Set mkdir /app and sets it as Working Directory
# WORKDIR /app

# # This tells npm what to install
# COPY package*.json ./

# # Install production dependencies
# RUN npm install --only=production


# RUN npm install --include=dev

# COPY . .

# # Expose backend port
# EXPOSE 8080

# # Production start command (don't use dev)
# CMD ["npm", "run", "start"]


# # TRY 2 - for PROD
# FROM node:18

# RUN apt-get update && apt-get install -y \
#     build-essential \
#     libsqlite3-dev \
# 	python3

# # Set /app as the working directory
# WORKDIR /app

# # Copy package.json and package-lock.json
# COPY package*.json ./

# # Install production dependencies
# RUN npm install

# # Copy the rest of the source code
# COPY . .

# # Build TypeScript code
# RUN npm run build

# # Expose backend port
# EXPOSE 8080

# # Run the production start command
# CMD ["npm", "run", "start"]


# Try 3 - for PROD

FROM node:18

# Install required native packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy source files
COPY . .

# Copy and prepare the entrypoint script
COPY my_backend.sh /app/my_backend.sh
RUN chmod +x /app/my_backend.sh

# Expose backend port
EXPOSE 8080

# Run the entrypoint script on container start
CMD ["/app/my_backend.sh"]