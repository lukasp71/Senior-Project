// File: lib/education_section/education_modules/threats_and_attacks/intro_to_threats_and_attacks_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/common_threats_page.dart';
import 'package:senior_project/education_section/layouts/educational_module_page.dart';

final String introText = '''
### Definition:
- **Cybersecurity** is aimed at protecting individuals' and organizations' systems, applications, computing devices, sensitive data, and financial assets from various threats.
- **Cyber threats** are potential dangers associated with cyber activities that can cause harm by way of unauthorized access, data breach, or malicious attack on network systems.
- **Cyber attacks** are malicious activities conducted by individuals or groups intending to compromise the integrity, confidentiality, or availability of network systems and data.

### Common Cyber Threats:
- **Malware**: Malicious software including spyware, ransomware, viruses, and worms which get installed into the system when a user clicks on a dangerous link or email. Once inside the system, malware can block access to critical components of the network and cause damage.

### Identifying a Cyber Attack:
- Understanding the mode of operation of malicious digital objects significantly enhances one's security both online and offline. Recognizing the digital footprint patterns of these nefarious tools can provide valuable knowledge to avoid or even eliminate them.

### Importance of Understanding Cyber Threats and Attacks:
- Knowledge of cybersecurity threats and attack methodologies is crucial for both individuals and organizations to proactively defend against potential risks, ensure data privacy, and maintain network security.
- Understanding common threats and attack vectors can aid in the implementation of effective preventive measures and response strategies to mitigate the risks associated with cyber-attacks.
''';

class IntroToThreatsAndAttacksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModuleIntroPage(
      moduleTitle: 'Introduction to Cybersecurity',
      introText: 'This module provides an introduction to cybersecurity...',
      onStart: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommonCyberThreatsPage()),
        );
      },
    );
  }
}
