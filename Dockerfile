# Set base image to Ubuntu (latest version)
FROM ubuntu:latest

# Update
RUN apt-get update && apt-get upgrade -y

# Install Samba 
RUN apt install samba

# Add setup files to container temp directory
ADD smb.conf /tmp/
ADD runconfig.sh /tmp/

# Move the Samba Conf file to correct location
RUN mv /etc/samba/smb.conf /etc/samba/smb.conf.orig 
RUN mv /tmp/smb.conf /etc/samba/

# Put the services that need to be started into the bashrc file
RUN echo "service rpcbind start" >> ~/.bashrc && \
chmod +x /tmp/runconfig.sh && \
echo "/tmp/./runconfig.sh" >> ~/.bashrc

CMD /bin/bash

# Expose ports
EXPOSE 445
EXPOSE 135
EXPOSE 138
EXPOSE 139
EXPOSE 137/udp
EXPOSE 138/udp
