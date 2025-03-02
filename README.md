# Toximark | Tennaxia x ESIEA [![My Skills](https://skillicons.dev/icons?i=flutter,supabase,dart)](https://skillicons.dev)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

Ce projet a été développé dans le cadre de la 8ᵉ édition de la Digital Consulting Week (DCW), un événement collaboratif organisé conjointement par l’ESIEA et SKEMA Business School (20 au 25 janvier 2025). Cet événement offre l’opportunité de développer des solutions innovantes en réponse aux défis actuels du secteur numérique.

---
## Objectif du projet 🎯 

L’objectif de ce projet était de développer un prototype d’application permettant à un producteur de déchets et un transporteur d’effectuer sur smartphone une signature électronique manuscrite et géolocalisée, en réponse à la problématique posée par Tennaxia, partenaire de la performance durable des entreprises et des investisseurs depuis plus de 20 ans.

---
## Technologies utilisées 🛠️

* **[Flutter](https://flutter.dev/)** : Framework open-source de développement d’applications multiplateformes, permettant de créer des interfaces utilisateur natives pour iOS et Android avec une base de code unique.
  
* **[Supabase](https://supabase.com/)** : Plateforme open-source offrant des services backend tels que l’authentification, la base de données et le stockage, facilitant le développement rapide d’applications.
  
* **[Riverpod](https://riverpod.dev/fr/)** : Gestionnaire d’état pour Flutter, offrant une approche réactive et sûre à la compilation pour la gestion de l’état de l’application.
  
* **[Geolocator](https://pub.dev/packages/geolocator)** : Package Flutter permettant d’accéder aux services de localisation de l’appareil, utilisé pour géolocaliser la position de l'appareil sur lequel est effectué la signature.

---

## Fonctionnalités principales ✨
* Signature électronique manuscrite géolocalisée.

* Affichage des différents ramassages.

---
## Structure du Projet 🏗️

Le projet est structuré selon les bonnes pratiques recommandées par Riverpod, assurant une architecture modulaire et maintenable. Cette approche facilite la séparation des préoccupations et améliore la testabilité du code.
Pour plus d'informations, voici un article : [Flutter App Architecture with Riverpod](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)

---
## Démarrer l'application 🚀

Pour lancer l'application, utilisez la configuration de lancement dans VSCode/Android Studio ou utilisez les commandes suivantes :

```sh
$ flutter run --flavor development --target lib/main_development.dart
```

_\*Toximark works on iOS and Android._

---

## Licence 📄

Ce projet est sous licence GPL v3. Voir le fichier LICENSE pour plus de détails.
