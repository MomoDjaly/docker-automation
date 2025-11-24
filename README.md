# Docker Stack Automatisation

Ce projet permet d'automatiser la gestion d'une stack **Docker Compose** à l'aide d'un script Bash ('stack.sh').


## Fonctionnalités
Le script permet de :

  - Démarrer la stack
  - Arrêter la stack
  - Afficher l'état des conteneurs
  - Consulter les logs d'un service
  - Rédémarrer un service spécifique

## Utilisation

Rendre le script éxécutable:

"chmod +x stack.sh"

Puis utiliser l'une des commandes suivantes :


### Démarrer la stack

./stack.sh start

### Arrêter la stack

./stack.sh stop

### Voir les conteneurs actifs

./stack.sh status

### Voir les logs d'un service

./stack.sh logs <service>

Exemple= "./stack.sh logs web"

### Redémarrer un service

./stack.sh restart <service>

### Vérifier la santé de la stack

./stack.sh health

### Obtenir des informations sur la stack

./stack.sh info



## Préréquis

  - Docker
  - Docker Compose
  - Linux/WSL/Ubuntu

## Auteur et but du projet

Mohamed Djalil DIABAGATE Étudiant en BTS SIO
Projet réalisé dans le cadre d'un apprentissage Docker et Compose
