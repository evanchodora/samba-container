# Set base image to Ubuntu
FROM ubuntu:latest

# Update
RUN apt-get update && apt-get upgrade -y

# Expose ports
EXPOSE 445
EXPOSE 135
EXPOSE 138
EXPOSE 139
EXPOSE 137/udp
EXPOSE 138/udp
