# Set base image to Ubuntu (latest version)
FROM ubuntu:latest

# Update
RUN apt-get update && apt-get upgrade -y

# Install Samba 
RUN apt install samba

# Add setup files to container temp directory
ADD smb.conf /tmp/
ADD runconfig.sh /tmp/

# Add directory to mount volume
RUN mkdir /storage/

# Move the Samba Conf file to correct location
RUN mv /etc/samba/smb.conf /etc/samba/smb.conf.orig 
RUN mv /tmp/smb.conf /etc/samba/

# Run start to start services
ADD start.sh /bin/start.sh
RUN chmod a+x /bin/start.sh
CMD ["./bin/start.sh"]

# Expose ports
EXPOSE 445
EXPOSE 135
EXPOSE 138
EXPOSE 139
EXPOSE 137/udp
EXPOSE 138/udp
