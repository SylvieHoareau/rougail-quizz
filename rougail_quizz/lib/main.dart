import 'package:flutter/material.dart';
import 'question.dart';
import 'data.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Question {
  String texte;
  bool reponse;
  Question(this.texte, this.reponse);
}

void main() {
  runApp(const QuizzApp());
}

// L'entrée de l'application, la fonction main() est le point de départ de l'exécution de l'application Flutter. Elle appelle la fonction runApp() qui prend un widget comme argument et le rend à l'écran. Dans ce cas, nous passons une instance de MyApp, qui est le widget racine de notre application.
class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rougail Quizz',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // On définit la page d'accueil de l'application, qui est un widget EcranAccueil. C'est la première page que les utilisateurs verront lorsqu'ils ouvriront l'application.
      home: const EcranAccueil(),
    );
  }
}

// Ecran d'accueil
class EcranAccueil extends StatelessWidget {
  const EcranAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Le Scaffold fournit la structure de base (appBar, body)
      appBar: AppBar(title: const Text("Rougail Quizz")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 150),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // AJOUT du paramètre title obligatoire ici !
                    builder: (context) => const EcranQuizz(title: "Session Quizz"),
                  ),
                );
              },
              child: const Text("Lancer le Quizz"),
            ),
          ],
        ),
      ),
    );
  }
}

class EcranQuizz extends StatefulWidget {
  const EcranQuizz({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<EcranQuizz> createState() => _EcranQuizzState();
}

class _EcranQuizzState extends State<EcranQuizz> {
  int score = 0;
  int indexQuestion = 0; // Pour savoir quelle question afficher

  // Voici ta banque de questions
  List<Question> listeDeQuestions = [
    Question("Le Piton de la Fournaise est l'un des volcans les plus actifs au monde.", true),
    Question("La Réunion est située dans l'océan Atlantique.", false),
    Question("Le chef-lieu de la Réunion est Saint-Denis.", true),
    Question("La monnaie utilisée à la Réunion est le Franc Pacifique.", false),
    Question("Le Piton des Neiges est le point culminant de l'île.", true),
    Question("La Réunion possède trois cirques : Mafate, Cilaos et Salazie.", true),
    Question("La Réunion est une île volcanique d'origine corallienne.", false),
    Question("Le climat de la Réunion est tropical humide.", true),
    Question("La langue régionale parlée est le Créole réunionnais.", true),
    Question("La Réunion est une destination touristique populaire pour les amateurs de randonnée.", true),
    Question("L'île de la Réunion fait partie de l'archipel des Mascareignes.", true),
    Question('La "Route du Littoral" relie Saint-Denis à Saint-Pierre.', false),
  ];

  // Future<List<Question>> loadQuestions() async {
  //   // 1. Charger le fichier sous forme de chaîne de caractères
  //   final String response = await rootBundle.loadString('assets/questions.json');
    
  //   // 2. Décoder la chaîne en liste d'objets dynamiques
  //   final List<dynamic> data = json.decode(response);
    
  //   // 3. Transformer la liste dynamique en liste d'objets Question
  //   return data.map((json) => Question(json['questionText'], json['isCorrect'])).toList();
  // }

  void verifierReponse(bool choixUtilisateur) {
    // Logique pour vérifier la réponse de l'utilisateur
    // Par exemple, si la bonne réponse est "true" :
    bool bonneReponse = listeDeQuestions[indexQuestion].reponse; // Remplacez par la logique réelle

    // On détermine si la réponse est correcte pour le feedback visuel
    bool estCorrect = choixUtilisateur == bonneReponse;

    // Création du feedback visuel
    final snackBar = SnackBar(
      backgroundColor: choixUtilisateur == bonneReponse ? Colors.green : Colors.red,
      content: Row(
        children: [
          Icon(
            estCorrect ? Icons.check_circle_outline : Icons.error_outline,
            color: Colors.white,
            semanticLabel: estCorrect ? "Succès" : "Erreur", // Important pour l'accessibilité
          ),
          const SizedBox(width: 12),
            Expanded(
              child: Text(
                estCorrect ? "Bonne réponse !" : "Mauvaise réponse...",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 2), // Laisse assez de temps pour la
    );

    // On affiche la barre
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    setState(() {
      // 1. Vérification du score
      if (choixUtilisateur == bonneReponse) {
        score++;
      }

      // 2. Passage à la question suivante ou reset
      if (indexQuestion < listeDeQuestions.length - 1) {
        indexQuestion++;
      } 
      else {
        // --- LOGIQUE DE NAVIGATION ---
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EcranScore(
              scoreFinal: score,
              totalQuestions: listeDeQuestions.length,
            ),
          ),
        ).then((_) {
          // Ce code s'exécute quand on revient de l'écran score (après le pop)
          setState(() {
            indexQuestion = 0;
            score = 0;
          });
        }
        );
      }});
    }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Rougail Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Question actuelle avec une description pour les lecteurs d'écran
            Semantics(
              header: true,
              label: "Question actuelle",
              child:  Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  listeDeQuestions[indexQuestion].texte, // Dynamique !                  
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

           // 2. Boutons espacés et larges
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: 200, height: 60, // Zone de clic confortable
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800], foregroundColor: Colors.white),
                  onPressed: () => verifierReponse(true),
                  child: const Text("VRAI", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            
            // Un peu d'espace entre les boutons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: 200, height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[900], foregroundColor: Colors.white),
                  onPressed: () => verifierReponse(false),
                  child: const Text("FAUX", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            
            const Divider(height: 50, indent: 50, endIndent: 50),

            // 3. Score avec icône pour les daltoniens
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 30),
                Text(
                  " Score : $score",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 30), // Un peu d'espace
            OutlinedButton.icon(
              onPressed: () {
                // Cette commande ferme l'écran actuel et revient à l'accueil
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home),
              label: const Text("Quitter et retour à l'accueil"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent, // Une couleur qui indique qu'on quitte
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EcranScore extends StatelessWidget {
  final int scoreFinal;
  final int totalQuestions;

  const EcranScore({super.key, required this.scoreFinal, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Résultat Final")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
            const SizedBox(height: 20),
            Text(
              "Bravo ! Ton score est de :",
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              "$scoreFinal / $totalQuestions",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // On "dépile" pour revenir au premier écran
                Navigator.pop(context);
              },
              child: const Text("Recommencer le Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
