import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: QuizPage()));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> questions = [
    'What is a Mobile Permission?',
    'Which type of Permissions are featured in VPNs and AutoFill?',
    'What kind of Permission is safe in most cases?',
    'Time Permissions give an app limited access to...',
    'If you download an unknown app that is asking for camera permission, you probably should:',
  ];

  final List<List<String>> choices = [
    [
      'Access that you give to a specific application on a mobile device',
      'Access you give to a computer to access another one remotely',
      'Your username and password',
      'All of the above',
    ],
    [
      'Mobile Permissions',
      'Install Time Permissions',
      'Signature Permissions',
      'Normal Permissions',
    ],
    [
      'Mobile Permissions',
      'Google Permissions',
      'Apple Permissions',
      'Normal Permissions',
    ],
    [
      'Encrypted Data',
      'Leaked Files',
      'Restricted Data',
      'Corrupted Data',
    ],
    [
      'Accept the Permission',
      'Research it First',
      'Avoid It',
      'Both B and C',
    ],  
  ];

  final List<int> correctAnswers = [
    0,
    1,
    3,
    2,
    3,
  ]; 
  late List<int?> userAnswers; 
  bool isSubmitted = false;

  @override
  void initState() {
    super.initState();
    userAnswers =
        List.filled(questions.length, null); 
  }

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
                          activeColor: isSubmitted
                              ? (choiceIndex == correctAnswers[index]
                                  ? Colors.green
                                  : (userAnswers[index] == choiceIndex
                                      ? Colors.red
                                      : null))
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
        child: const Text('Submit'),
      ),
    );
  }
}
