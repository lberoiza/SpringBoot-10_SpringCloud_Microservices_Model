#!/bin/bash

# Aplicar las configuraciones iniciales
kubectl delete -f k8s_scripts/configmap.yaml \
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
              -f k8s_scripts/clusterrolle-binding.yaml \
              -f k8s_scripts/deployment-usuarios.yaml \
              -f k8s_scripts/deployment-cursos.yaml


