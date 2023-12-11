import 'package:flutter/material.dart';

import 'package:senior_project/education_section/layouts/subsection_page.dart';


const String subsectionTitle = 'Cybersecurity Laws in the United States';
const String content = '''
# Cyber Laws and Regulations in the United States

## Introduction

Governments worldwide have established laws to protect information both physically and virtually. In the United States, several significant laws have been passed to safeguard data and maintain cybersecurity.

## Key Cybersecurity Laws

## 1. Health Insurance Portability and Accountability Act (HIPAA)
- **Year Enacted:** 1996
- **Purpose:** Controls who can access and view medical and health information.

## 2. Homeland Security Act
- **Year Enacted:** 2002, following the 9/11 attacks
- **Establishment:** Created the Department of Homeland Security
- **Objective:** Implemented new procedures to enhance public protection.

## 3. Cybersecurity Information Sharing Act (CISA)
- **Year Enacted:** 2015
- **Encouragement:** Motivates private companies to share information about cyber threats with the U.S. government.
- **Liability Protection:** Offers legal protections for these companies.

# Additional Resources

This information is provided by Enterprise Engineering Solutions and Knowledgehut.com.

For more details, visit:
- [EES Corporation on Cybersecurity Laws and Regulations in the US](https://www.eescorporation.com/cybersecurity-laws-and-regulations-in-us/)
- [Knowledgehut on Cyber Security Laws](https://www.knowledgehut.com/blog/security/cyber-security-laws)
''';

class LawPage extends StatelessWidget {
  const LawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      
    );
  }
}
