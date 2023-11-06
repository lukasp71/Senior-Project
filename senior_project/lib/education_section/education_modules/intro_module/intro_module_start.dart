// File: lib/education_section/education_modules/introduction_to_cybersecurity/intro_to_cybersecurity_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/educational_module_page.dart';

final Module introToCybersecurityModule = Module(
  'Introduction to Cybersecurity',
  '''
    Learn the basics of cybersecurity. Cybersecurity is crucial for safeguarding the integrity, 
    confidentiality, and availability of information in the digital world. It encompasses measures 
    taken to protect systems, networks, and programs from digital attacks aimed at accessing, changing, 
    or destroying sensitive information, extorting money from users via ransomware, or interrupting 
    normal business processes.
  ''',
  [
    'Definition and Importance',
    'Key Concepts',
    'Historical Context',
    'Careers in Cybersecurity',
  ],
);

class IntroToCybersecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModuleIntroPage(introToCybersecurityModule);
  }
}
