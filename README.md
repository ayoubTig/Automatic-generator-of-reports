# Automatic-generator-of-reports
une application web d’automatiser la génération des rapports à partir d'un document source (format Word également) afin de gagner le temps sur la rédaction du rapport et de pouvoir extraire certaines informations de la plate-forme de l’application et les insérer dans le rapport client mettant en charge l’espace de consultation, d’administration et d’exploitation des données à travers des représentations graphiques (chart dynamique) , la possibilité de le convertir format PDF, cette application web est développé par la technologie JEE.
## La problématique:
Ce  projet consiste à réaliser une plateforme web d’automatiser la génération des rapports
(format Word également) à partir des informations qui viennent de l’application, au lieu d'ouvrir le document Word et remplir toutes ses informations manuellement, dans de multiples rapports, la
chose qui rendre le travail pénible il gaspille le temps dans le processus de la rédaction. Alors notre problématique c’est de développer une plateforme web pour automatiser la génération
des rapports à partir d'un document source (format Word également) afin de gagner le temps sur la rédaction du rapport et de pouvoir extraire certaines informations de différents types (textes, images, documents,…) de la plate-forme de l’application et les insérer dans le rapport , ensuite de persister ces données dans une base de données relationnel et d’avoir le droit de les consulter à partir des tableaux de consultation et des graphs dynamique.
### les acteurs: 
L’administrateur : cette application est dynamique dont le contenu est renouvelé ce qui nécessite
une partie liée à l’administration pour gérer les différentes options de notre plateforme, et avoir le
droit d’accéder à toutes les fonctionnalités de l’application.
L’utilisateur : son rôle est d’utiliser des espaces limités dans l’application à savoir création des
rapports, consultation…
### Les Besoins fonctionnels:
Inscription et l’authentification.
La génération automatique d’un rapport de prévention à partir d’une Template source standard.
La génération automatique d’un rapport d’évaluation à partir d’une Template source standard.
La consultation des rapports générés.
Une zone de recherche permet d’effectuer une recherche via des multiples critères de recherche.
Conversion de rapport généré d’un format docx au format PDF.15
Des graphes dynamiques qui représentent les informations contenues dans la base de données.
Espace contact qui contient les cordonnées des responsables et réalisateurs de l’application.
L’administrateur doit avoir l’accès à toutes les options possibles de l’application.
L’administrateur peut ajouter des informations liées au rapport sur la base de données.
L’administrateur peut supprimer des informations de la base de données.
L’administrateur peut ajouter un autre administrateur ou utilisateur.
### Les Besoins non fonctionnels:
L’application web doit être réalisée avec la technologie JEE qui permet de réaliser des applications
web en exploitant la puissance du langage java.
La base de données MySQL est utilisée.
L’application doit être rapide par rapport au temps de réponse.
La lisibilité de site : l’application doit être simple et facile à utiliser.
La sécurité : l’application devra être hautement sécurisée, les informations ne devront pas être
accessibles à tout le monde.
La confidentialité : les données des utilisateurs doivent être en toute sécurité.
L’évolution : la possibilité de supprimer ou rajouter des utilisateurs sans modification majeure sur
l’application
### La conception:
![Alt text](https://github.com/ayoubTig/Automatic-generator-of-reports/blob/master/ImagesOfReadme/Capture.PNG)
![Alt text](https://github.com/ayoubTig/Automatic-generator-of-reports/blob/master/ImagesOfReadme/DagrameSeq.png)
![Alt text](https://github.com/ayoubTig/Automatic-generator-of-reports/blob/master/ImagesOfReadme/Activity.PNG)

### les screenShoot de l'application:
![Alt text](https://github.com/ayoubTig/Automatic-generator-of-reports/blob/master/ImagesOfReadme/Inscription.png)
![Alt text](https://github.com/ayoubTig/Automatic-generator-of-reports/blob/master/ImagesOfReadme/MainPage.png)

![Alt text](https://github.com/ayoubTig/Automatic-generator-of-reports/blob/master/ImagesOfReadme/Appa.png )
![Alt text](https://github.com/ayoubTig/Automatic-generator-of-reports/blob/master/ImagesOfReadme/App2.png )
