# POC: AI in Drupal


## 1st step
clone the project using HTTPS since we're not using SSH yet:
git clone https://github.com/SmailKou/poc-drupal.git

## 2nd step
Make sure that docker and docker-compose are installed on your machine, navigate to the repository directory and run this command:
##### docker-compose up -d
This will pull the images on your machine, create the containers and have them running.

## 3rd step
Install composer and run the following command:
##### composer install
This will generate a lock file and a /vendor repository.
notice: if you want to run the command inside the container, make sur you have access via bash or sh:
##### winpty docker-compose exec -it drupal sh
After mounting a volume in the docker-compose file, running 'composer install' inside the container is not mandatory, since any changes should apply on both sides. However, if needed, you can still run the command inside the Drupal container.
Always inside you will need to run these commands:
##### drush cr
##### drush updb
Navigate to your site: http://localhost

## 4th step
You may have to import the database on your drupal site, but since there is no interesting thing that has been done yet, just install it and begin from scratch.

## Commands that you will need

### Docker commands:

To bring the images, create and run the containers:
#### docker-compose up -d

Access to the drupal container:
#### winpty docker-compose exec -it drupal sh
notice: if you don't have winpty, you will have to install it.

### Drush commands to run inside the container

##### rebuild cache: drush cr
##### clear the cache: drush cc
##### update the database: drush updb
##### watchdog errors: drush ws
##### import config: drush cim
##### export config: drush cex
##### import database: drush sql:cli < example.sql
##### export database: drush sql:dump > example.sql

## Git Guide
1- the main brainch on the project was named #main  2- make sure you pull all the changes before doing anything: git pull  3- create your development branch from main: git checkout -b name_of_your_branch  4- after committing merge your local development branch into the main: (navigate into main) git merge name_of_your_branch  4- to resolve conflicts, you can rebase: git pull --rebase origin main
