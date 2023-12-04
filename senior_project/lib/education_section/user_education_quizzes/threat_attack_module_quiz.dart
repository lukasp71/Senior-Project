import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: ThreatAttackQuizPage()));

class ThreatAttackQuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<ThreatAttackQuizPage> {
  final List<String> questions = [
    'What is phishing?',
    'What is a Distributed Denial of Service (DDoS) attack?',
    'Which threat involves exploiting software vulnerabilities to gain unauthorized access?',
    'What does the term "Zero-Day" refer to in cybersecurity?',
    'What is the first step in a typical cyber attack?',
    'What is the purpose of the exploitation phase in a cyber attack?',
    'Which phase of an attack involves cleaning up traces to avoid detection?',
    'What is the primary goal of incident response?',
    'During which phase of incident response is the root cause of the incident identified?',
    'What is the first step in a standard incident response process?',
    'What is the principle of least privilege (PoLP)?',
    'How does encryption contribute to cybersecurity?',
    'What is multi-factor authentication (MFA)?',
    'Why is it important to keep software and systems up to date?',
    'Which of the following is a preventive measure against phishing attacks?',
  ];

  final List<List<String>> choices = [
    [
      'Sending emails to lure individuals into revealing personal information',
      'Protecting sensitive data from unauthorized access',
      'Creating a fake website to trick users',
      'Encrypting data to prevent unauthorized access',
    ],
    [
      'Blocking access to a system by overwhelming it with traffic',
      'Stealing sensitive data from a network',
      'Exploiting software vulnerabilities',
      'Sending malicious email attachments to users',
    ],
    [
      'Phishing',
      'Social Engineering',
      'Malware',
      'Exploit',
    ],
    [
      'A vulnerability known to the vendor with no fix available',
      'A vulnerability unknown to the vendor',
      'A vulnerability known to the vendor with a fix available',
      'A vulnerability disclosed to the public before the vendor is aware',
    ],
    [
      'Reconnaissance',
      'Exploitation',
      'Delivery',
      'Installation',
    ],
    [
      'Establish a communication channel with a command and control server',
      'Spread to other systems',
      'Bypass security measures',
      'All of the above',
    ],
    [
      'Exfiltration',
      'Installation',
      'Reconnaissance',
      'Maintenance',
    ],
    [
      'To restore services and data to normal',
      'To identify the attacker',
      'To prevent future attacks',
      'All of the above',
    ],
    [
      'Preparation',
      'Identification',
      'Eradication',
      'Recovery',
    ],
    [
      'Preparation',
      'Identification',
      'Containment',
      'Eradication',
    ],
    [
      'Access should only be granted on a need-to-know basis',
      'Every user should have administrator privileges',
      'Users should have unlimited access to all parts of the system',
      'None of the above',
    ],
    [
      'It makes data unreadable to unauthorized users',
      'It increases the speed of data transmission',
      'It reduces the amount of data storage required',
      'It makes data accessible to unauthorized users',
    ],
    [
      'Using a single authentication method multiple times',
      'Using multiple methods of authentication',
      'Authenticating a user multiple times',
      'None of the above',
    ],
    [
      'To introduce new features',
      'To fix bugs and vulnerabilities',
      'To ensure compatibility with new hardware',
      'All of the above',
    ],
    [
      'Clicking on links from unknown senders',
      'Sharing passwords with trusted colleagues',
      'Using the same password for all accounts',
      'Verifying the sender’s email address before responding to requests for sensitive information',
    ]
  ];

  final List<int> correctAnswers = [
    0, // Phishing
    0, // DDoS
    2, // Malware
    1, // Zero-Day
    0, // Establish a communication channel with a command and control server
    1, // Installation
    3, // All of the above (for Incident Response)
    3, // Recovery
    2, // Containment
    0, // Access should only be granted on a need-to-know basis
    0, // It makes data unreadable to unauthorized users
    1, // Using multiple methods of authentication
    1, // To fix bugs and vulnerabilities
    3, // Verifying the sender’s email address before responding to requests for sensitive information
  ]; // 0-based index of the correct answer
  late List<int?> userAnswers; // User's selected answers
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
      bool hasAttempted = await service.getQuizProgress('attemptUserQuiz2');
      if (hasAttempted) {
        int previousScore = await service.getQuizScore('userQuiz2Score');
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
            'You have already attempted this quiz and your highest score is $previousScore. Would you like to attempt again to try and get a higher score?'),
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
      int previousScore = await service.getQuizScore('userQuiz2Score');

      if (score > previousScore) {
        // Update only if the new score is higher
        service.updateQuizScore('userQuiz2Score', score);
        service.updateQuizProgress('attemptUserQuiz2', true);
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
