import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: FirewallQuizPage()));

class FirewallQuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<FirewallQuizPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
            questions.length,
            (index) => _buildQuestionCard(index),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitQuiz,
        child: const Text('Submit'),
      ),
    );
  }

  Widget _buildQuestionCard(int index) {
    return Card(
      child: Column(
        children: [
          Text(questions[index]),
          ...List.generate(
            choices[index].length,
            (choiceIndex) => RadioListTile<int>(
              value: choiceIndex,
              groupValue: userAnswers[index],
              onChanged: isSubmitted
                  ? null
                  : (value) => setState(() => userAnswers[index] = value),
              title: Text(choices[index][choiceIndex]),
              activeColor: _getAnswerColor(index, choiceIndex),
            ),
          ),
        ],
      ),
    );
  }

  Color? _getAnswerColor(int index, int choiceIndex) {
    if (!isSubmitted) return null;
    return choiceIndex == correctAnswers[index]
        ? Colors.green
        : (userAnswers[index] == choiceIndex ? Colors.red : null);
  }

  @override
  void initState() {
    super.initState();
    userAnswers = List.filled(questions.length, null);
    _checkQuizProgress();
  }

  void _checkQuizProgress() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseService service = DatabaseService(uid: user.uid);
      bool hasAttempted = await service.getQuizProgress('attemptBusinessQuiz4');
      if (hasAttempted) {
        int previousScore = await service.getQuizScore('businessQuiz4Score');
        _showAttemptDialog(previousScore);
      }
    }
  }

  void _showAttemptDialog(int previousScore) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Attempt'),
        content: Text(
            'You have already attempted this quiz and your highest score is $previousScore/${questions.length}. Would you like to attempt again to try and get a higher score?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Additional logic if required when user chooses to retake the quiz
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  void _submitQuiz() async {
    if (isSubmitted) return; // Prevent re-submitting

    int score = 0;
    for (int i = 0; i < correctAnswers.length; i++) {
      if (userAnswers[i] == correctAnswers[i]) {
        score++;
      }
    }

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DatabaseService service = DatabaseService(uid: user.uid);
      int previousScore = await service.getQuizScore('businessQuiz4Score');

      if (score > previousScore) {
        // Update only if the new score is higher
        service.updateQuizScore('businessQuiz4Score', score);
        service.updateQuizProgress('attemptBusinessQuiz4', true);
      }
    }

    setState(() => isSubmitted = true);
    _showScoreDialog(score);
  }

  void _showScoreDialog(int score) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Results'),
        content: Text('Your score: $score/${questions.length}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: _showIncorrectAnswers,
            child: const Text('Show Incorrect Answers'),
          ),
        ],
      ),
    );
  }

  void _showIncorrectAnswers() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Incorrect Answers'),
        content: SingleChildScrollView(
          child: ListBody(
            children: _getIncorrectAnswerWidgets(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  List<Widget> _getIncorrectAnswerWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] != null && userAnswers[i] != correctAnswers[i]) {
        widgets.add(Text('Q: ${questions[i]}'));
        widgets.add(const SizedBox(height: 10));
      }
    }
    if (widgets.isEmpty) {
      widgets.add(const Text('No incorrect answers!'));
    }
    return widgets;
  }
}
