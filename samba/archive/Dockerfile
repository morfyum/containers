FROM alpine:latest

RUN apk update && apk add samba samba-common-tools

RUN mkdir -p /srv/samba/shared

COPY smb.conf /etc/samba/smb.conf

# A Samba szerver futtatásakor ne legyen szigorú ellenőrzés
# (Ez segít a jogosultsági problémák elkerülésében)
EXPOSE 445

CMD ["smbd", "-F", "--no-process-group"]
