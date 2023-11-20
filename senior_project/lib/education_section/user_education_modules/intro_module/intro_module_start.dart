import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/def_importance_page.dart';
import 'package:senior_project/education_section/layouts/educational_module_page.dart';

const String moduleTitle ='Section 1.1: Introduction to Cybersecurity';
const String introText = '''
    Learn the basics of cybersecurity. Cybersecurity is crucial for safeguarding the integrity, 
    confidentiality, and availability of information in the digital world. It encompasses measures 
    taken to protect systems, networks, and programs from digital attacks aimed at accessing, changing, 
    or destroying sensitive information, extorting money from users via ransomware, or interrupting 
    normal business processes.
  ''';

class IntroToCybersecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModuleIntroPage(
      moduleTitle: moduleTitle,
      introText: introText,
      onStart: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DefinitionAndImportancePage(),
          ),
        );
      },
    );
  }
}

class ModuleIntroPage extends StatelessWidget {
  final String moduleTitle;
  final String introText;
  final VoidCallback onStart;

  const ModuleIntroPage({
    Key? key,
    required this.moduleTitle,
    required this.introText,
    required this.onStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module Intro Page'),
        backgroundColor: const Color.fromARGB(255, 0, 94, 172),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                moduleTitle,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                introText,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: onStart,
                child: Text('Start Module'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}