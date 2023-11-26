import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: IntroQuizPage()));

class IntroQuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<IntroQuizPage> {
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

  void _submitQuiz() {
    if (isSubmitted) return; // Prevent re-submitting

    int score = 0;
    for (int i = 0; i < correctAnswers.length; i++) {
      if (userAnswers[i] == correctAnswers[i]) {
        score++;
      }
    }

    setState(() => isSubmitted = true);
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? "";
    DatabaseService service = DatabaseService(uid: uid);
    service.updateQuizScore('IntroModuleQuizScore', score);
    // TODO: Call your updateQuizScore function here
    // Example: DatabaseService(uid: yourUserId).updateQuizScore('yourModuleName', score);

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
        ],
      ),
    );
  }
}
