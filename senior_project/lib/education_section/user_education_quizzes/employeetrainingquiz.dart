import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: EmployeeTrainingQuiz()));

class EmployeeTrainingQuiz extends StatefulWidget {
  @override
  _EmployeeTrainingQuizState createState() => _EmployeeTrainingQuizState();
}

class _EmployeeTrainingQuizState extends State<EmployeeTrainingQuiz> {
  final List<String> questions = [
    'What is a Danger of Having Untrained Employees?',
    'What is a Benefit of Having Trained Employees',
    'What should you do about Passwords?',
    'What kind of Software should not be used in the workplace?',
    'What should you do about Company Debit and Credit Cards?',
  ];

  final List<List<String>> choices = [
    [
      'Human error can lead to a data breach',
      'The Company will get more money',
      'No one will want to work there',
      'All of the Above',
    ],
    [
      'There will be more Employees',
      'There is a decreased risk of security events happening',
      'There will be an increased risk of security events happening',
      'All of the above',
    ],
    [
      'Make them easy to remember',
      'Share them with your closest friends',
      'Change the passwords reguarly',
      'Keep the same password forever',
    ],
    [
      'Company Applications',
      'Unauthorized Software',
      'Authorized Software',
      'None of the above',
    ],
    [
      'Make sure to set limits',
      'Ensure they are ONLY used for company purchases',
      'Ensure that only authorized employees have access to it',
      'All of the above',
    ],
  ];

  final List<int> correctAnswers = [
    0,
    1,
    2,
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
      bool hasAttempted = await service.getQuizProgress('attemptBusinessQuiz6');
      if (hasAttempted) {
        int previousScore = await service.getQuizScore('businessQuiz6Score');
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
      int previousScore = await service.getQuizScore('businessQuiz6Score');

      if (score > previousScore) {
        // Update only if the new score is higher
        service.updateQuizScore('businessQuiz6Score', score);
        service.updateQuizProgress('attemptBusinessQuiz6', true);
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
