import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: QuizPage()));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> questions = [
    'What is cybersecurity?',
    'Why is cybersecurity important?',
    'What can be a consequence of inadequate cybersecurity for a company?',
    'Which of the following is a key concept in cybersecurity?',
    'Which historical event significantly impacted the evolution of cybersecurity?',
    'Which of the following is an entry-level job in cybersecurity?',
    'Which career path in cybersecurity focuses on identifying vulnerabilities in systems and networks?',
  ];

  final List<List<String>> choices = [
    [
      'The protection of internet-connected systems from cyber-attacks',
      'The study of computer programming',
      'The process of building networks',
      'The act of hacking into systems',
    ],
    [
      'To protect sensitive data from unauthorized access',
      'To ensure uninterrupted business operations',
      'To comply with legal and regulatory requirements',
      'All of the above',
    ],
    [
      'Financial losses',
      'Damage to reputation',
      'Legal penalties',
      'All of the above',
    ],
    [
      'Confidentiality',
      'Integrity',
      'Availability',
      'All of the above',
    ],
    [
      'The Morris Worm',
      'The invention of the internet',
      'The Y2K bug',
      'The creation of the first antivirus software',
    ],
    [
      'Information Security Analyst',
      'Cybersecurity Consultant',
      'Penetration Tester',
      'Cybersecurity Manager',
    ],
    [
      'Engineering',
      'Incident Response',
      'Management',
      'Testing and Hacking (Ethical Hacking)',
    ],
  ];

  final List<int> correctAnswers = [
    0,
    3,
    3,
    3,
    0,
    0,
    3
  ]; // 0-based index of the correct answer
  late List<int?> userAnswers; // User's selected answers
  bool isSubmitted = false;

  @override
  void initState() {
    super.initState();
    userAnswers =
        List.filled(questions.length, null); // Initialize with null values
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
        child: Text('Submit'),
      ),
    );
  }
}
