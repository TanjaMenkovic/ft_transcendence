#!/bin/bash

cd /app

# Build
echo "----------------Building...----------------"
npm run build

# Remove default nginx site and replace with Vite build
echo "Replacing default Nginx site with Vite build..."
rm -rf /var/www/html && cp -r dist /var/www/html

# Start Nginx
echo "----------------Starting Nginx...----------------"
nginx -g "daemon off;"