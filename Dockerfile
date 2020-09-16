# Build a container running nginx

FROM nginx:latest

# Copy our web application to the correct directory in the container
COPY ./webapp/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

