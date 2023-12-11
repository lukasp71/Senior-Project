import 'package:flutter/material.dart';

import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Section 1.3: Key Concepts of Cybersecurity';
const String content = '''
# 1. The CIA Triad:
- **Confidentiality:** Ensures that information is accessible only to those authorized to have access.
- **Integrity:** Safeguards the accuracy and completeness of information and processing methods.
- **Availability:** Ensures that authorized users have access to information and associated assets when required.

# 2. Core Threats:
- **Ransomware:** A type of malware that encrypts files or systems, demanding a ransom for decryption keys.
- **Botnets:** Networks of compromised computers used to spread malware or carry out attacks.
- **Distributed Denial of Service (DDoS):** An attack that overwhelms a system with traffic, rendering it unavailable.
- **Social Engineering:** Manipulative techniques that trick individuals into divulging confidential information.
- **Cryptojacking:** Unauthorized use of someone's device to mine cryptocurrency.
- **Phishing:** Fraudulent attempts, usually via email, to steal sensitive information.

# 3. Cybersecurity Measures:
- **Data Backup & Recovery:** Ensuring data is regularly backed up and can be recovered in the event of loss.
- **Firewalls:** Network security systems that monitor and control incoming and outgoing network traffic.
- **Anti-virus Software:** Programs that detect and neutralize malicious software.
- **Two-Factor Authentication (2FA):** An extra layer of security used to ensure that people trying to gain access to an online account are who they say they are.

# 4. Risk Management:
- **Identifying Threats:** Recognizing potential threats to an organization's information systems.
- **Detecting Intrusions:** Monitoring systems to detect unauthorized activities.
- **Protecting Data:** Implementing measures to protect data from unauthorized access or alterations.
- **Responding to Attacks:** Having a plan in place to respond to security incidents.
- **Recovering Databases and Systems:** Restoring and validating system functionality for business continuity after a security incident.

# 5. Additional Concepts:
- **Encryption:** The process of converting data into a code to prevent unauthorized access.
- **Decryption:** The process of converting encoded data back into its original form.
- **Malware:** Malicious software designed to harm or exploit any device or network.
- **VPN (Virtual Private Network):** A technology that creates a safe and encrypted connection over a less secure network, such as the internet.
''';

class KeyConceptsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
     
    );
  }
}
