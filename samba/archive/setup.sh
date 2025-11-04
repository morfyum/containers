# smbpasswd -a <felhasználónév> parancs végrehajtása és jelszó beállítása
# A jelszó beállítást manuálisan kell elvégezni az építés után vagy egyedi szkripttel.
# Egyszerűbb, ha a futtatás után adod hozzá, de most az építési folyamatba illesztjük.

# Építjük a konténerképet
podman build -t my-samba-share .

# Futtatjuk a képet, és a konténeren belül beállítjuk a felhasználót.
podman run -d --name samba-setup my-samba-share sleep infinity

# Hozzuk létre a Linux felhasználót (ha nem létezik) és állítsuk be a Samba jelszót
podman exec samba-setup sh -c 'adduser -D -h /srv/samba/shared pduser'
podman exec samba-setup sh -c 'echo -e "JELSZO\nJELSZO\n" | smbpasswd -a -s pduser'

# Állítsuk be a létrehozott felhasználót engedélyezettre
podman exec samba-setup smbpasswd -e pduser

# Töröljük a setup konténert (csak beállításra használtuk)
podman stop samba-setup
podman rm samba-setup

# Építsük újra a képet, hogy a felhasználói adatbázis benne legyen (egyszerűsítve)
# A jelszó adatbázis (tdb) hozzáadása a képhez bonyolult, ezért futtatáskor fogjuk 
# a tdbsam-et manuálisan beállítani (lásd a következő lépés).
# Helyette építsünk egy olyan képet, ami tartalmazza a felhasználót és futtassuk az smbd-t!
