import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: MobileQuizPage()));

class MobileQuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<MobileQuizPage> {
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
      bool hasAttempted = await service.getQuizProgress('attemptBusinessQuiz5');
      if (hasAttempted) {
        int previousScore = await service.getQuizScore('businessQuiz5Score');
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
      int previousScore = await service.getQuizScore('businessQuiz5Score');

      if (score > previousScore) {
        // Update only if the new score is higher
        service.updateQuizScore('businessQuiz5Score', score);
        service.updateQuizProgress('attemptBusinessQuiz5', true);
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
