import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/databse.dart';

void main() => runApp(MaterialApp(home: SocialEngineeringQuizPage()));

class SocialEngineeringQuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<SocialEngineeringQuizPage> {
  final List<String> questions = [
    'What is social engineering in the context of cybersecurity?',
    'Which technique involves sending fraudulent messages to steal sensitive information?',
    'What was the target of the Russian group Gamaredon\'s spear phishing emails in 2022?',
    'Which of the following is an example of \'scareware\'?',
    'Deepfake technology was used in a social engineering attack against which type of organization?',
    'What does \'tailgating\' in social engineering refer to?',
    'Which approach should be taken when you receive an email request for sensitive information?',
    'What ethical dilemma does social engineering raise in cybersecurity?',
    'Which type of attack tricked Facebook and Google into transferring over \$100 million?',
    'Why is it important to think about your digital footprint in relation to social engineering?'
  ];

  final List<List<String>> choices = [
    [
      'Hacking into systems directly',
      'Manipulating people into revealing confidential information',
      'Building secure networks',
      'Studying computer programming'
    ],
    ['Tailgating', 'Baiting', 'Phishing', 'Pretexting'],
    [
      'US tech companies',
      'Ukrainian government agencies',
      'UK energy companies',
      'Chinese manufacturers'
    ],
    [
      'Tricking users into downloading malware as a security solution',
      'Redirecting users to malicious sites via DNS spoofing',
      'Following authorized personnel into secure areas',
      'Creating a fabricated scenario to obtain information'
    ],
    [
      'A UK energy company',
      'Facebook and Google',
      'The US Department of Labor',
      'A Chinese plane parts manufacturer'
    ],
    [
      'Sending deceptive emails',
      'Following someone into a secured area',
      'Offering something enticing in exchange for information',
      'Scaring users into installing malware'
    ],
    [
      'Check the source\'s authenticity',
      'Respond immediately',
      'Share limited information',
      'Ignore and delete the email'
    ],
    [
      'The balance between internet speed and safety',
      'The trade-off between software cost and efficiency',
      'The choice between system and personal security',
      'The balance between security and privacy'
    ],
    [
      'Watering hole attack',
      'Spear phishing scam',
      'DNS spoofing',
      'Pretexting'
    ],
    [
      'To prevent overuse of digital devices',
      'To avoid sharing too much personal information online',
      'To improve your internet browsing speed',
      'To increase your social media following'
    ]
  ];

  final List<int> correctAnswers = [1, 2, 1, 0, 0, 1, 0, 3, 1, 1];
// 0-based index of the correct answer
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
    service.updateQuizScore('SocialEngineeringQuizScore', score);

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
