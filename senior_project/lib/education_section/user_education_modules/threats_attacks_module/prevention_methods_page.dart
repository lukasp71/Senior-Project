// File: lib/education_section/education_modules/threats_and_attacks/prevention_measures_page.dart

import 'package:flutter/material.dart';

import 'package:senior_project/education_section/layouts/subsection_page.dart';


const String subsectionTitle = 'Prevention Measures';
const String content = '''
# Prevention Measures:

## 1. **Cyber Hygiene Basics:**
   - **Strong Passwords:** Utilize a combination of letters, numbers, and special characters to create strong, unique passwords for each account.
   - **Software Updates:** Keep all software, including antivirus software, updated to protect against known vulnerabilities.
   - **Suspicious Links:** Exercise caution when clicking on links, especially from unknown sources.
   - **Multi-factor Authentication (MFA):** Enable MFA where available to add an additional layer of security.

## 2. **Data Protection:**
   - **Data Encryption:** Encrypt sensitive data to limit access to authorized parties only.
   - **Regular Backups:** Create regular backups of important data to ensure it can be recovered in case of loss or corruption.

## 3. **Organizational Measures:**
   - **Cybersecurity Policy:** Establish a robust cybersecurity policy that guides all measures used in your organization to improve cybersecurity efficiency.
   - **Employee Training:** Educate employees on cybersecurity best practices and how to recognize potential threats like phishing emails.

## 4. **Technical Measures:**
   - **Email Security Measures:** Implement security measures for email and other applications to prevent phishing and other types of attacks.
   - **Network Security:** Utilize firewalls, intrusion detection systems, and other network security measures to monitor and protect the network from unauthorized access.

## 5. **Individual Measures:**
   - **Unique Passwords:** Create a unique and original password for each account and update passwords every three months.
''';

class PreventionMeasuresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      
    );
  }
}
