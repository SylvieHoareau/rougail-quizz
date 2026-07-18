## Rougail Quizz

## Présentation

Rougail Quizz est une application de quiz interactive développée avec **Flutter**.
Ce projet a été réalisée dans le cadre d'une montée en compétences personnelle.

L'objectif est de valider les bases du développement multiplateforme, la gestion d'état (`StatefulWidget`) et l'installation d'environnements de développement sous **Debian 12**.

- Objectif : Offrir une application de quizz sur l'île de La Réunion pour se cultiver et s'amuser

## Fonctionnalités Clés

- [x] Affichage dynamique des questions
- [x] Validation des réponses en temps réeel
- [x] Calcul automatique du score
- [ ] Système de navigation vers un écran de fin (en cours)
- [ ] Persistance des données (à venir)

## Stack technique
- **Langage :** Dart
- **Framework :** Flutter (Cible Linux Desktop)
- **OS de développement :** Debian 12 (Bookworm)
- **Outils de build :** CMake, Ninja, Clang++

## Installation et Lancement (Debian 12)

### Prérequis
Assurez-vous d'avoir installé les dépendances système pour Flutter sur Linux :
```bash
sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev
```

#### Installation

Cloner le dépôt :

```bash
git clone [https://github.com/ton-pseudo/rougail-quizz.git](https://github.com/ton-pseudo/rougail-quizz.git)
```

Accéder au dossier :

```bash
cd rougail-quizz
```

Récupérer les dépendances Flutter :

```bash
flutter pub get
```

#### Lancement
Pour lancer l'application en mode debug sur Linux :

```bash
flutter run -d linux
```

## Compétences validées

- **Maquettage et UI :** Création de composants Flutter.

- **Logique de programmation :** Utilisation de listes d'objets et gestion d'index.

- **Environnement :** Configuration d'une chaîne de compilation native sous Linux.