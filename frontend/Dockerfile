# # frontend/Dockerfile
# FROM node:20

# WORKDIR /app

# COPY package*.json ./
# RUN npm install --include=dev

# COPY . .

# # Expose Vite dev server port (default is 5173)
# EXPOSE 5173

# CMD ["npm", "run", "dev"]


# frontend/Dockerfile
FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

# Expose the port if you're serving the app with a server like Nginx
EXPOSE 5173

# Run production build (do not use dev server)
CMD ["npm", "run", "build"]