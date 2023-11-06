import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: QuizPage()));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> questions = [
    'What is malware?',
    'What type of malware encrypts files and demands payment for the decryption key?',
    'Which malware spreads by copying itself onto other programs?',
    'What type of malware disguises itself as legitimate software?',
    'Which of the following malware types collects sensitive information from a user without their knowledge?',
    'What is a possible long-term effect of malware attacks on a business?',
    'Which of the following can be a direct financial impact of malware?',
    'What term is used to describe malicious advertisements that spread malware?',
    'Which of the following is a common way for malware to spread on social networks?',
    'What is a common recommendation for preventing malware infections?',
    'In the event of a malware infection, what is the first step in remediation?'
  ];

  final List<List<String>> choices = [
    [
      'A type of software designed to harm or exploit any device',
      'A beneficial software tool',
      'A programming language',
      'A type of hardware device'
    ],
    ['Virus', 'Worm', 'Trojan', 'Ransomware'],
    ['Worm', 'Trojan', 'Spyware', 'Adware'],
    ['Worm', 'Trojan', 'Ransomware', 'Adware'],
    ['Spyware', 'Adware', 'Virus', 'Worm'],
    [
      'Loss of customer trust',
      'Increased website traffic',
      'Improved system performance',
      'Faster internet connection'
    ],
    [
      'Cost of remediation',
      'Increased sales',
      'Lower operational costs',
      'Better investment returns'
    ],
    ['Adware', 'Malvertising', 'Spam', 'Phishing'],
    [
      'Through friend requests',
      'Through shared photos',
      'Through malicious links',
      'Through profile updates'
    ],
    [
      'Use of strong, unique passwords',
      'Regularly updating software and systems',
      'Avoiding suspicious links and attachments',
      'All of the above'
    ],
    [
      'Disconnecting affected systems from the network',
      'Paying any requested ransom',
      'Deleting all files on the system',
      'Ignoring the problem and hoping it resolves itself'
    ]
  ];

  final List<int> correctAnswers = [
    0,
    3,
    0,
    1,
    0,
    0,
    0,
    1,
    2,
    3,
    0
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
