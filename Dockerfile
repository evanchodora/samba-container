# Set base image to Ubuntu (latest version)
FROM ubuntu:latest

# Update
RUN apt-get update && apt-get upgrade -y

# Install Samba 
RUN apt install samba

# Expose ports
EXPOSE 445
EXPOSE 135
EXPOSE 138
EXPOSE 139
EXPOSE 137/udp
EXPOSE 138/udp
