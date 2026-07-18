# 🎯 Rougail Quizz

[![Flutter](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Language-Dart-0175C2?logo=dart)](https://dart.dev)

## 📖 Description du Projet
**Rougail Quizz** est une application mobile de quiz dynamique axée sur la culture réunionnaise. 
Ce projet a été développé dans le respect des bonnes pratiques de conception logicielle du Titre Professionnel CDA (Niveau 6).

## 🚀 Fonctionnalités
* **Gestion des Quiz** : Sélection de catégories, niveaux de difficulté et progression en temps réel.
* **Persistance des Données** : Sauvegarde des scores locaux et de l'historique de l'utilisateur.
* **Interface Adaptative (UI/UX)** : Design responsive adapté aux smartphones et tablettes, respectant l'accessibilité.

## 🛠️ Stack Technique & Architecture
* **Frontend** : Flutter & Dart
* **State Management** :Riverpod
* **Architecture** : Architecture propre (Clean Architecture) organisée en couches distinctes (*Data*, *Domain*, *Presentation*) pour garantir la maintenabilité et la testabilité du code.

## 📦 Installation et Configuration

### Prérequis
* Flutter SDK (Version 3.44.6)
* Un émulateur (Android/iOS) ou un appareil physique configuré

### Clonage et Lancement
```bash
# 1. Cloner le dépôt
git clone [https://github.com/ton-username/rougail_quizz.git](https://github.com/ton-username/rougail_quizz.git)

# 2. Accéder au dossier
cd rougail_quizz

# 3. Récupérer les dépendances
flutter pub get

# 4. Lancer l'application
flutter run

```
## 🧪 Qualité du Code & Tests

Conformément aux exigences du métier de CDA, la robustesse de l'application est validée par :

* **Tests Unitaires** : Validation des composants métier et de la logique des quiz.

* **Analyse Statique** : Utilisation du Linter Flutter officiel pour garantir un code propre et homogène.

## 🛡️ Sécurité & RGPD

* Validation et nettoyage systématique des entrées utilisateur.

* Stockage sécurisé des préférences et données sensibles localement.
