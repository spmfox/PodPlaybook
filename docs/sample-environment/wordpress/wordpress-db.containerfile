FROM docker.io/mariadb:latest

LABEL start="podman run -d --rm=true --name wordpress-db --pod wordpress \
-e MARIADB_DATABASE=wordpress \
-e MARIADB_ROOT_PASSWORD=TESTTESTTEST \
wordpress-db:latest"

#Build
#podman build -t wordpress-db -f wordpress-db.containerfile

#Manual start
#podman container runlabel start wordpress-db

#Pod Start
#podman pod create --name wordpress -p 8080:80
