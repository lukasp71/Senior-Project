import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: QuizPage()));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> questions = [
    'What is a safe way of Messaging Anonymously?',
    'What is an Ad Blocker?',
    'Which Firewall has Intrusion Detection and URL Filtering?',
    'Which Firewall lets you monitor and secure traffic across both physical and virtual networks?',
    'What is the difference between NIPS and WIPS?',
    'Which VPN would you use if you need to access company sites outside of work?',
  ];

  final List<List<String>> choices = [
    [
      'Use an App that no one uses',
      'Use an encrypted internet connection and messaging app that supports encryption.',
      'Send messages on a network with no password',
      'All of the Above',
    ],
    [
      'Program that adds advertisements across a site',
      'Program that blocks advertisements on all websites',
      'Program that Unsubscribes you from emails',
      'All of the Above',
    ],
    [
      'Network-based Intrusion Prevention System',
      'Wireless Intrusion Prevention System',
      'Network Behavior Analysis System',
      'Host-Based Intrusion Prevention System',
    ],
    [
      'WIPS does not analyze advanced protocols like TCP, while NIPS does.',
      'NIPS ',
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
    1,
    1,
    0,
    2,
    2,
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
