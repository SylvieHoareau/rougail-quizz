import 'package:flutter/material.dart';

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

  void verifierReponse(bool reponseUtilisateur) {
    // Logique pour vérifier la réponse de l'utilisateur
    // Par exemple, si la bonne réponse est "true" :
    bool bonneReponse = true; // Remplacez par la logique réelle

    setState(() {
      if (reponseUtilisateur == bonneReponse) {
        score++;
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Rougail Quiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Est-ce que Debian 12 est une distribution Linux ?",
              style: TextStyle(color: Colors.black, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () => verifierReponse(true),
            child: const Text("VRAI"),
          ),
          ElevatedButton(
            onPressed: () => verifierReponse(false),
            child: const Text("FAUX"),
          ),
          const SizedBox(height: 20),
          Text(
            "Score actuel : $score",
            style: const TextStyle(color: Colors.green, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
