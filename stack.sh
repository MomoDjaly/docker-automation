#!/bin/bash

# =====================================
#  Script de gestion Docker Compose
#  Auteur : Mohamed Djalil Diabagate
#  Description :
#       Automatisation de la stack Docker :
#       start, stop, status, logs, restart
# =====================================

#Couleurs (pour afficage stylé)
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
NC="\e[0m" # No Color

#Vérification: un permier argument est obligatoire

if [ -z "$1" ]; then
  echo -e "${RED} Aucune commande précisée.${NC}"
  echo "Usage: ./stack.sh <start|stop|status|logs|restart>"
  exit 1
fi

case "$1" in

  start)
    echo -e "${GREEN} Démarrage de la stack ...${NC}"
    docker-compose up -d
    ;;

  stop)
    echo -e "${RED} Arrêt de la stack ...${NC}"
    docker-compose down
    ;;

  status)
    echo -e "${BLUE} Etat des conteneurs :${NC}"
    docker ps
    ;;

  logs)
    if [ -z "$2" ]; then
      echo -e "${YELLOW} Veuillez préciser un service :${NC}"
      echo "./stack.sh logs <service>"
      exit 1
    fi
    echo -e "${BLUE} Logs du service : $2${NC}"
    docker-compose logs
    ;;

  restart)
    if [ -z "$2" ]; then
      echo -e "${YELLOW} Veuillez préciser un service a redémarrer:${NC}"
      echo "./stack.sh restart <service>"
      exit 1
    fi
    echo -e "${GREEN} Rédemarrage du service: $2${NC}"
    docker-compose restart $2
    ;;

  health)
   echo -e "${BLUE} vérification de l'état des services...${NC}"
   docker-compose ps --format "table {{.Name}}\t{{.State}}\t{{.Status}}"
   ;;

  info)
    echo -e "${GREEN} Informations sur la stack :${NC}"
    docker-compose ps
    echo ""
    echo -e "${YELLOW} Réseaux Docker :${NC}"
    docker network ls
    echo ""
    echo -e "${BLUE} Image utilisées :${NC}"
    docker images
    ;;

  *)
    echo -e "${YELLOW}Commandes disponibles :${NC}"
    echo "./stack.sh start"
    echo "./stack.sh stop"
    echo "./stach.sh status"
    echo "./stack.sh logs <service>"
    echo "./stack.sh restart <service>"
    echo "./stack.sh health"
    echo ".stack.sh info"
    exit 1
   ;;

esac
