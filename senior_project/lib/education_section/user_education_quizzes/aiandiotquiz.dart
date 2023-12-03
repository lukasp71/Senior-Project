import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: AIandIoTQuizPage()));

class AIandIoTQuizPage extends StatefulWidget {
  @override
  _AIandIoTQuizPageState createState() => _AIandIoTQuizPageState();
}

class _AIandIoTQuizPageState extends State<AIandIoTQuizPage> {
  final List<String> questions = [
    'What is a common problem with AI?',
    'What can Machine Learning do for us?',
    'Now that we have AI, what is a potential concern we consider?',
    'What is something that most devices have that IoT devices do not?',
    'How can we make IoT devices less vulnerable?',
  ];

  final List<List<String>> choices = [
    [
      'It does not know anything',
      'Humans making a mistake when configurating it',
      'People do not know how to find AI tools',
      'AI hacks into systems',
    ],
    [
      'Give us new information',
      'Add new jobs',
      'Take outliers from preset rules and place it into collections of data with similarities or oddities.',
      'All of the above',
    ],
    [
      'Not enough experts in the field',
      'Lack of Jobs',
      'Lack of Creativity',
      'Increase of Technical Issues',
    ],
    [
      'Passwords',
      'Touch Screens',
      'Internet Capabilities',
      'Encryption',
    ],
    [
      'Put it on a Public Network',
      'Not using them',
      'Keep them on a seperate network',
      'All of the Above',
    ],
  ];

  final List<int> correctAnswers = [
    1,
    2,
    0,
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
      bool hasAttempted = await service.getQuizProgress('attemptBusinessQuiz1');
      if (hasAttempted) {
        int previousScore = await service.getQuizScore('businessQuiz1Score');
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
      int previousScore = await service.getQuizScore('businessQuiz1Score');

      if (score > previousScore) {
        // Update only if the new score is higher
        service.updateQuizScore('businessQuiz1Score', score);
        service.updateQuizProgress('attemptBusinessQuiz1', true);
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
