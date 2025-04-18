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


FROM node:18

# Set /app as the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install production dependencies
RUN npm install --only=production

# Copy the rest of the source code
COPY . .

# Build TypeScript code
RUN npm run build

# Expose backend port
EXPOSE 8080

# Run the production start command
CMD ["npm", "run", "start"]