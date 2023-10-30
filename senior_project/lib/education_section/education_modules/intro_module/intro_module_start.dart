// File: lib/education_section/education_modules/introduction_to_cybersecurity/intro_to_cybersecurity_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/education_modules/intro_module/def_importance_page.dart';
import 'package:senior_project/education_section/layouts/educational_module_page.dart';

final String moduleTitle = 'Introduction to Cybersecurity';
final String introText = '''
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
              builder: (context) => DefinitionAndImportancePage()),
        );
      },
    );
  }
}
