import 'package:flutter/material.dart';

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
      home: const EcranQuizz(title: 'Rougail Quizz Home Page'),
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
    Question("Debian 12 est une distribution Linux ?", true),
    Question("Flutter utilise le langage PHP ?", false),
    Question("Le CDA est un titre de niveau 6 ?", true),
    Question("L'accessibilité est inutile en mobile ?", false),
  ];

  void verifierReponse(bool choixUtilisateur) {
    // Logique pour vérifier la réponse de l'utilisateur
    // Par exemple, si la bonne réponse est "true" :
    bool bonneReponse = listeDeQuestions[indexQuestion].reponse; // Remplacez par la logique réelle

    setState(() {
      // 1. Vérification du score
      if (choixUtilisateur == bonneReponse) {
        score++;
      }

      // 2. Passage à la question suivante ou reset
      if (indexQuestion < listeDeQuestions.length - 1) {
        indexQuestion++;
      } else {
        // Optionnel : On peut afficher un message de fin ici
        print("Fin du quizz ! Score final : $score");
        // Pour l'exemple, on recommence à zéro
        indexQuestion = 0;
        score = 0;
      }
    });
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
          ],
        ),
      ),
    );
  }
}
