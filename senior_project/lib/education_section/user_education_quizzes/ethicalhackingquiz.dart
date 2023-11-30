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
    'What is a tool that Ethical Hacker use?',
    'What is the Health Law that went into affect in 1996?',
    'What did the Homeland Security Act Do?',
  ];

  final List<List<String>> choices = [
    [
      'A Mix of White and Black Hat activities',
      'Perform malicious activities',
      'Recover Lost Data from Customers',
      'Conduct Penetration Testing',
    ],
    [
      'They will never do something malicious to you',
      'Add new jobs',
      'Test your cybersecurity systems and give you advice on how to improve it',
      'Both A and C',
    ],
    [
      'They steal company information from businesses',
      'Conduct unauthorized activities',
      'They can become more powerful due to ignorant employees.',
      'All of the Above',
    ],
    [
      'CCleaner',
      'Norton Antivirus',
      'Nmap',
      'iTunes',
    ],  
    [
      'Homeland Security Act',
      'Affordable Care Act',
      'Health Insurance Portability and Accountability Act (HIPAA)',
      'Cybersecurity Information Sharing Act (CISA)',
    ],
    [
      'Established the CIA',
      'Established the FBI',
      'Established the Department of Homeland Security',
      'Established the Department of War',
    ],  
  ];

  final List<int> correctAnswers = [
    0,
    3,
    3,
    2,
    3,
    2,
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
