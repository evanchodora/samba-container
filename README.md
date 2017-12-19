# samba-container
Docker container to mount a Samba volume

```
  sudo docker run -d --name samba -p 445:455 -p 137:137 -p 138:138 -p 139:139 -v /media/storage:/storage smbdocker
```  
