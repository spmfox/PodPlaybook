FROM docker.io/library/wordpress:latest

LABEL start="podman run -d --rm=true --name wordpress-app --pod wordpress \
-e WORDPRESS_DB_HOST=127.0.0.1 \
-e WORDPRESS_DB_USER=root \
-e WORDPRESS_DB_PASSWORD=TESTTESTTEST \
-e WORDPRESS_DB_NAME=wordpress \
-e WORDPRESS_TABLE_PREFIX=wp_ \
wordpress-app:latest"

#Build
#podman build -t wordpress-app -f wordpress-app.containerfile

#Manual start
#podman container runlabel start wordpress-app

#Pod Start
#podman pod create --name wordpress -p 8080:80
