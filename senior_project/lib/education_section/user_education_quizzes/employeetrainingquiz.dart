import 'package:flutter/material.dart';

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
