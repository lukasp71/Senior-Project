import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: QuizPage()));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> questions = [
    'What does a Grey Hat Hacker do?',
    'What is a benefit of a White Hat Hacker?',
    'Why are Black Hat Hackers Malicious?',
    'What is a tool that Ethical Hackers use?',
    'Which one is the most accurate definition of Ethical Hacking?',
  ];

  final List<List<String>> choices = [
    [
      'Break into systems illegally',
      'Break into systems legally',
      'Break into systems legally and illegally',
      'Provide Cybersecurity advice',
    ],
    [
      'They can help us find out how weak our systems are and how to fix them',
      'They can hack into any system and retrieve stolen data whenever we want',
      'Give us tips on how to prevent future attacks',
      'Both A and C',
    ],
    [
      'They can cause data breaches',
      'They can cause critical cybersecurity attacks',
      'Data can be stolen without the other person knowing',
      'All of the Above',
    ],
    [
      'Nmap',
      'Photoshop',
      'Kali Linux',
      'Both A and C',
    ],
    [
      'People who break into systems and steal their information',
      'People who Disable Home Security Systems remotely',
      'People who usually are hired by companies to test their security systems and give them advice on preventing attacks. ',
      'All of the Above',
    ],  
  ];

  final List<int> correctAnswers = [
    2,
    2,
    3,
    3,
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
