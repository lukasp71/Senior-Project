import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: QuizPage()));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> questions = [
    'What is the capital of France?',
    'What is the capital of Italy?',
    // ... other questions
  ];

  final List<List<String>> choices = [
    ['Paris', 'Rome', 'London'],
    ['Rome', 'Paris', 'Berlin'],
    // ... other choices
  ];

  final List<int> correctAnswers = [
    0,
    0
  ]; // 0-based index of the correct answer
  List<int?> userAnswers = [null, null]; // User's selected answers
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
            questions.length,
            (index) {
              return Card(
                child: Column(
                  children: [
                    Text(questions[index]),
                    ...List.generate(
                      choices[index].length,
                      (choiceIndex) {
                        return RadioListTile<int>(
                          value: choiceIndex,
                          groupValue: userAnswers[index],
                          onChanged: isSubmitted
                              ? null
                              : (value) {
                                  setState(() {
                                    userAnswers[index] = value;
                                  });
                                },
                          title: Text(choices[index][choiceIndex]),
                          activeColor:
                              userAnswers[index] == correctAnswers[index]
                                  ? Colors.green
                                  : (isSubmitted && userAnswers[index] != null)
                                      ? Colors.red
                                      : null,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isSubmitted = true;
          });
        },
        child: Text('Submit'),
      ),
    );
  }
}
