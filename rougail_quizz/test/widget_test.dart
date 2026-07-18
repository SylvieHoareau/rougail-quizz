// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rougail_quizz/main.dart';

void main() {
  testWidgets("Affichage du titre de bienvenue sur la page d'accueil", (
    WidgetTester tester,
  ) async {
    // 1. Charger le widget dans le conteneur de test virtuel
    await tester.pumpWidget(const QuizzApp());

    // 2. Vérifier que le titre de ton Quiz est bien présent à l'écran
    expect(find.text('Bienvenue au Rougail Quizz'), findsOneWidget);

    // 3. Vérifier qu'un texte d'erreur n'apparaît pas
    expect(find.text('Erreur de chargement'), findsNothing);
  });
}
