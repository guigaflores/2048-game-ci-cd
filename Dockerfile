# Use the official Nginx image as the base
FROM 008971670328.dkr.ecr.us-east-1.amazonaws.com/nginx

# Copy the 2048 game files to the Nginx web root
COPY . /usr/share/nginx/html

# Expose the default Nginx HTTP port
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
