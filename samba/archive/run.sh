# A 137, 138, 139 és 445 portok szükségesek a Sambához.

podman run -d \
  --name samba-share \
  -p 445:445/tcp \
  -v $PWD/shared:/srv/samba/shared:Z \
  my-samba-share
  

podman exec samba-share sh -c 'adduser -D -h /srv/samba/shared pduser'
podman exec samba-share smbpasswd -a pduser
