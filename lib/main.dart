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

  // ✅ Questions
  List<String> questions = [
    'Sharks are mammals',
    'Jawaharlal Nehru was the first Prime Minister of India',
    'India got independence in 1947',
    'Ganga is the longest river in India',
  ];

  // ✅ Correct answers
  List<bool> answers = [
    false,
    true,
    true,
    true,
  ];

  int questionIndex = 0;
  List<Widget> scoreKeeper = [];

  // 🔥 Function to check answer
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = answers[questionIndex];

    setState(() {
      if (userAnswer == correctAnswer) {
        // ✅ Correct
        scoreKeeper.add(
          const Icon(Icons.check, color: Colors.green),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are RIGHT ✅')),
        );
      } else {
        // ❌ Wrong
        scoreKeeper.add(
          const Icon(Icons.close, color: Colors.red),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are WRONG ❌')),
        );
      }

      // Move to next question
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        questionIndex = 0;
        scoreKeeper.clear();
      }
    });
  }

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
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
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