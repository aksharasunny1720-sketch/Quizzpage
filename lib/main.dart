import 'package:flutter/material.dart';

void main() {
  runApp(const Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {

  // ✅ Questions list
  List<String> questions = [
    'Sharks are mammals',
    'Who was the first Prime Minister of India?',
    'In which year did India gain independence?',
    'Which is the longest river in India?',
  ];

  // ✅ Question index
  int questionIndex = 0;

  // ✅ Score icons
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        // QUESTION
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                questions[questionIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),

        // TRUE BUTTON
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(
                    const Icon(Icons.check, color: Colors.green),
                  );

                  if (questionIndex < questions.length - 1) {
                    questionIndex++;
                  } else {
                    questionIndex = 0;
                    scoreKeeper.clear();
                  }
                });
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),

        // FALSE BUTTON
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(
                    const Icon(Icons.close, color: Colors.red),
                  );

                  if (questionIndex < questions.length - 1) {
                    questionIndex++;
                  } else {
                    questionIndex = 0;
                    scoreKeeper.clear();
                  }
                });
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),

        // SCORE ROW
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}