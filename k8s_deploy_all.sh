#!/bin/bash

# Aplicar las configuraciones iniciales
kubectl apply -f k8s_scripts/configmap.yaml \
              -f k8s_scripts/secret.yaml \
              -f k8s_scripts/mysql-pv.yaml \
              -f k8s_scripts/postgres-pv.yaml \
              -f k8s_scripts/mysql-pvc.yaml \
              -f k8s_scripts/postgres-pvc.yaml \
              -f k8s_scripts/svc-mysql.yaml \
              -f k8s_scripts/svc-postgres.yaml \
              -f k8s_scripts/svc-usuarios.yaml \
              -f k8s_scripts/svc-cursos.yaml \
              -f k8s_scripts/gateway.yaml \
              -f k8s_scripts/deployment-mysql.yaml \
              -f k8s_scripts/deployment-postgres.yaml \
              -f k8s_scripts/clusterrolle.yaml \
              -f k8s_scripts/clusterrolle-binding.yaml

# Función para verificar si un servicio está disponible
function wait_for_service() {
  local service_name=$1
  echo "Esperando a que el servicio $service_name esté operativo..."

  while true; do
    kubectl get svc $service_name > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "El servicio $service_name está operativo."
      break
    else
      echo "El servicio $service_name no está disponible. Reintentando en 5 segundos..."
      sleep 5
    fi
  done
}

# Esperar a que los servicios de MySQL y PostgreSQL estén operativos
wait_for_service "svc-mysql"
wait_for_service "svc-postgres"

# Aplicar las configuraciones restantes
kubectl apply -f k8s_scripts/deployment-usuarios.yaml -f k8s_scripts/deployment-cursos.yaml

echo "Configuraciones aplicadas exitosamente."
