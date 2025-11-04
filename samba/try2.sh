podman run -it --rm \
  --name samba \
  --network host \
  -p 445:445 \
  -e "NAME=Data" \
  -e "USER=samba" \
  -e "PASS=secret2" \
  -e "UID=1000" \
  -e "GID=1000" \
  -v "./shared:/storage:Z" \
  dockurr/samba

# TODO
# -v ./smb.conf:/etc/samba/smb.conf:Z \
# -v "${PWD:-.}/samba:/storage" \
