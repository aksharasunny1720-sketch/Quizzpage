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
        backgroundColor: Colors.black, // like first image
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

  String question = 'Sea otters have a favorite rock they use to break open food.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        // QUESTION SECTION
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                question,
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
                print('True pressed');
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
                print('False pressed');
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
        Row(
          children: [
            Icon(
              Icons.done,
            color: Colors.green,
            ),
            Icon(
                Icons.clear,
            color: Colors.red,
            ),
          ],
        )
      ],
    );
  }
}