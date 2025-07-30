#!/bin/bash

# VARIABLES
CONTAINER_NAME=frontend
IMAGE_NAME=frontend
REPO_DIR=/home/infrastructure/frontend/porfolioproject

echo "📦 1. Entrando al repositorio"
cd $REPO_DIR

echo "🔄 2. Haciendo git pull..."
git pull

echo "🛑 3. Parando y eliminando contenedor antiguo si existe..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

echo "🧼 4. Eliminando imagen antigua si existe..."
docker rmi $IMAGE_NAME 2>/dev/null

echo "🔧 5. Construyendo nueva imagen..."
docker build -t $IMAGE_NAME .

echo "🚀 6. Lanzando nuevo contenedor..."
docker run -d --name $CONTAINER_NAME -p 8080:80 $IMAGE_NAME

echo "✅ Despliegue completo."