FROM nginx:alpine

# Copy custom application landing page to Nginx default document root
COPY index.html /usr/share/nginx/html/index.html

# Expose internal container port
EXPOSE 80

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
