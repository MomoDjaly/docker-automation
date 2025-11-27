# Docker Automation – Stack Web + PostgreSQL + Script d’Administration

Ce projet met en place une stack Docker professionnelle composée d’un service Nginx et d’une base de données PostgreSQL.
La stack est entièrement configurable via un fichier .env et contrôlée par un script Bash permettant d’automatiser les tâches d’administration.

L’objectif est d’apprendre à gérer Docker et Docker Compose comme un administrateur système ou DevOps junior.


## Contenu du projet
	•	docker-compose.yml
	•	.env (variables d’environnement)
	•	stack.sh (script Bash d’automatisation)
	•	README.md


## Architecture du projet

### 1. Service Web (Nginx)
	•	Port expose : ${WEB_PORT}:80
	•	Sert un site statique depuis /usr/share/nginx/html
	•	Configurable via le fichier .env

### 2. Base de données (PostgreSQL)
	•	Variables d’environnement : POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB
	•	Données persistées via un volume Docker

### 3. Réseau Docker interne

Les services communiquent via un réseau privé créé automatiquement par Docker Compose.

### Fichier .env

Le fichier .env permet de modifier la configuration de la stack sans modifier le fichier docker-compose.yml.

Exemple :

WEB_PORT=8080
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin123
POSTGRES_DB=appdb

Changer une valeur puis relancer la stack applique automatiquement la configuration mise à jour.


## Utilisation du script stack.sh

### Rendre le script exécutable

chmod +x stack.sh

### Démarrer la stack

./stack.sh start

### Arrêter la stack

./stack.sh stop

### Voir les conteneurs actifs

./stack.sh status

### Consulter les logs d’un service

./stack.sh logs web
./stack.sh logs db

### Redémarrer un service spécifique

./stack.sh restart web

### Vérifier la santé de la stack

./stack.sh health

### Informations globales

./stack.sh info



### Accès au site web

Dans le navigateur :

http://localhost:${WEB_PORT}

Exemple si WEB_PORT=8080 :

http://localhost:8080

### Nettoyage des ressources inutilisées

Pour garder l’environnement propre :

docker container prune -f
docker volume prune -f
docker network prune -f
docker image prune -f


## Objectif du projet

Ce projet permet de consolider les compétences suivantes :
	•	Docker et Docker Compose
	•	Gestion d’une stack web + base de données
	•	Automatisation par script Bash
	•	Utilisation de variables d’environnement
	•	Compréhension des réseaux Docker
	•	Création d’environnements reproductibles et configurables

Il constitue un projet solide pour un portfolio visant une alternance en administration système, réseau ou DevOps.


Auteur

Mohamed Djalil DIABAGATE
Étudiant en BTS SIO
Projet réalisé pour l’apprentissage de Docker, Docker Compose et des outils d’automatisation.


