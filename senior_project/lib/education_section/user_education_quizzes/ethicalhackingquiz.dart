import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: EthicalHackingQuizPage()));

class EthicalHackingQuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<EthicalHackingQuizPage> {
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
      bool hasAttempted = await service.getQuizProgress('attemptBusinessQuiz3');
      if (hasAttempted) {
        int previousScore = await service.getQuizScore('businessQuiz3Score');
        _showAttemptDialog(previousScore);
      }
    }
  }

  void _showAttemptDialog(int previousScore) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Attempt'),
        content: Text(
            'You have already attempted this quiz and your highest score is $previousScore/${questions.length}. Would you like to attempt again to try and get a higher score?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Additional logic if required when user chooses to retake the quiz
            },
            child: Text('Yes'),
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
      int previousScore = await service.getQuizScore('businessQuiz3Score');

      if (score > previousScore) {
        // Update only if the new score is higher
        service.updateQuizScore('businessQuiz3Score', score);
        service.updateQuizProgress('attemptBusinessQuiz3', true);
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
        title: Text('Incorrect Answers'),
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
        widgets.add(SizedBox(height: 10));
      }
    }
    if (widgets.isEmpty) {
      widgets.add(Text('No incorrect answers!'));
    }
    return widgets;
  }
}
