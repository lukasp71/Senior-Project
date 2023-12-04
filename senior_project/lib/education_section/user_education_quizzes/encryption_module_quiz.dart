import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: EncryptionQuizPage()));

class EncryptionQuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<EncryptionQuizPage> {
  final List<String> questions = [
    'What is the primary purpose of encryption?',
    'Which type of encryption uses the same key for encryption and decryption?',
    'What is a significant challenge in symmetric encryption?',
    'RSA encryption is an example of which type of encryption?',
    'What does SSL/TLS primarily protect?',
    'In the context of SSL/TLS, what does a \'handshake\' process establish?',
    'What type of encryption is commonly used in HTTPS?',
    'Which is a key management challenge in encryption?',
    'What threat does quantum computing pose to current encryption?',
    'What is a future trend in encryption technology?',
    'Which algorithm is known for its speed and security in symmetric encryption?',
    'What is a major benefit of asymmetric encryption?',
    'What is a limitation of RSA encryption?',
    'Why is hybrid encryption often used in SSL/TLS?',
    'What is a critical aspect of managing encryption keys?'
  ];

  final List<List<String>> choices = [
    [
      'Speed up data processing',
      'Convert data into a coded format to prevent unauthorized access',
      'Increase data storage capacity',
      'Improve the aesthetics of data'
    ],
    ['Asymmetric', 'Symmetric', 'Hybrid', 'Quantum'],
    [
      'Slow processing speed',
      'Secure key exchange',
      'Public key distribution',
      'Data integrity verification'
    ],
    ['Symmetric', 'Asymmetric', 'Hybrid', 'Quantum'],
    [
      'Physical servers',
      'Internet communications',
      'Printed documents',
      'Wireless signals'
    ],
    [
      'A shared symmetric key',
      'The user\'s identity',
      'The connection speed',
      'Server location'
    ],
    ['Symmetric', 'Asymmetric', 'Hybrid', 'Quantum'],
    [
      'Algorithm selection',
      'Lifecycle management',
      'Color scheme design',
      'Programming language choice'
    ],
    [
      'Increased data storage demands',
      'Slower encryption speeds',
      'Breaking current encryption standards',
      'More complicated user interfaces'
    ],
    [
      'Moving away from digital methods',
      'Development of quantum-resistant algorithms',
      'Decreased reliance on encryption',
      'Use of single algorithms for all purposes'
    ],
    ['RSA', 'DES', 'AES', 'Diffie-Hellman'],
    [
      'Simple key management',
      'Faster than symmetric encryption',
      'No need for key exchange',
      'Allows public key distribution'
    ],
    [
      'Too simple algorithm',
      'Very fast data transmission',
      'Slower compared to symmetric methods',
      'Unlimited key size'
    ],
    [
      'To combine the speed of symmetric and the security of asymmetric encryption',
      'To make it easier for users',
      'To reduce the encryption key size',
      'To comply with legal requirements'
    ],
    [
      'Color coding',
      'Lifecycle management',
      'Alphabetical ordering',
      'Size of the key'
    ]
  ];

  final List<int> correctAnswers = [
    1,
    1,
    1,
    1,
    1,
    0,
    2,
    1,
    2,
    1,
    2,
    3,
    2,
    0,
    1
  ];

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
      bool hasAttempted = await service.getQuizProgress('attemptUserQuiz5');
      if (hasAttempted) {
        int previousScore = await service.getQuizScore('userQuiz5Score');
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
      int previousScore = await service.getQuizScore('userQuiz5Score');

      if (score > previousScore) {
        // Update only if the new score is higher
        service.updateQuizScore('userQuiz5Score', score);
        service.updateQuizProgress('attemptUserQuiz5', true);
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
            child: const Text('Show Incorrect Questions'),
          ),
        ],
      ),
    );
  }

  void _showIncorrectAnswers() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Incorrect Questions'),
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
