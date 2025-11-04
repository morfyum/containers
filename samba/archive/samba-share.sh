podman run -it --rm \
  --network host \
  -p 445:445 \
  -v ./shared:/mount:z \
  dperson/samba -p \
  -u "samba;secret" \
  -s "selfhost;/mount;yes;yes;yes;samba"
  #   name    ;/mount;read;write;usepassword;username

#  -p 139:139 -p 445:445 \

#podman run -it --rm --name samba \
#  -d dperson/samba \
#  -p 445:445 \
#  -e "NAME=Data" \
#  -e "USER=samba" \
#  -e "PASS=secret" \
#  -v ./shared:/storage \
#  dperson/samba 
#dockur/samba
