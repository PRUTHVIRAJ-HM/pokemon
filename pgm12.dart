import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctIndex;
  const Question(this.questionText, this.options, this.correctIndex);
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const List<Question> questions = [
    Question("What is the capital of France?", [
      "London",
      "Berlin",
      "Paris",
      "Rome",
    ], 2),
    Question("Which planet is known as the Red Planet?", [
      "Earth",
      "Mars",
      "Jupiter",
      "Saturn",
    ], 1),
    Question("What is 5 + 3?", ["5", "8", "9", "6"], 1),
  ];
  int currentIndex = 0;
  int score = 0;
  void answerQuestion(int selectedIndex) {
    if (selectedIndex == questions[currentIndex].correctIndex) {
      score++;
    }
    if (currentIndex < questions.length - 1) {
      setState(() => currentIndex++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ScorePage(score: score, total: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentIndex + 1}/${questions.length}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(currentQuestion.questionText, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ...currentQuestion.options.asMap().entries.map((entry) {
              return ElevatedButton(
                onPressed: () => answerQuestion(entry.key),
                child: Text(entry.value),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final int total;
  const ScorePage({required this.score, required this.total});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Score Board')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Score:', style: TextStyle(fontSize: 26)),
            Text(
              '$score / $total',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => QuizPage()),
                );
              },
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
