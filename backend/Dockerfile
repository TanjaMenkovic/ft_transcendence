FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

# Build TypeScript (if you're not committing compiled files)
RUN npm run build

EXPOSE 8080

CMD ["npm", "start"]