#!/bin/bash

case "$1" in

  start)
    echo "Démarrage de la stack ..."
    docker-compose up -d
    ;;

  stop)
    echo "Arrêt de la stack ..."
    docker-compose down
    ;;

  status)
    echo "Etat des conteneurs :"
    docker ps
    ;;

  logs)
    echo "Logs du service : $2"
    docker-compose logs $2
    ;;

  restart)
    echo "Redémarrage du service : $2"
    docker-compose restart $2
    ;;

  *)
    echo "Commandes disponibles :"
    echo "./stack.sh start"
    echo "./stack.sh stop"
    echo "./stach.sh status"
    echo "./stack.sh logs <service>"
    echo "./stack.sh restart <service>"
   ;;
esac
