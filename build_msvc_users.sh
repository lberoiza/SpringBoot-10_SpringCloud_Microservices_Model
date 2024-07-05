#!/bin/bash

MSVC_NAME=msvc-usuarios
IMAGE_NAME=curso-kubernetes_springcloud/$MSVC_NAME
TAGGED_IMAGE=lberoiza/curso-kubernetes_springcloud-$MSVC_NAME:latest

echo "Creando imagen $MSVC_NAME."
# Construir la imagen Docker
docker build \
	-t \
	$IMAGE_NAME:latest \
	-f $MSVC_NAME/Dockerfile \
	.

# Agregar el nuevo tag
docker tag $IMAGE_NAME:latest $TAGGED_IMAGE

# eliminar dangling images
echo "Eliminando las dangling images (imágenes colgantes)"
docker image prune -f

# Preguntar si desea subir la imagen a Docker Hub
read -p "¿Desea subir la imagen a Docker Hub? (y/n): " upload

if [ "$upload" == "y" ]; then
    docker push $TAGGED_IMAGE
else
    echo "Imagen etiquetada como $TAGGED_IMAGE, pero no subida a Docker Hub."
fi
