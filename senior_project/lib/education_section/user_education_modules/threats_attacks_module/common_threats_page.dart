// File: lib/education_section/education_modules/threats_and_attacks/common_cyber_threats_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/attack_methodology_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/intro_page.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Common Cyber Threats';
const String content = '''
### Definition and Types of Common Cyber Threats:
- **Malware**:
  - Definition: Malware, short for malicious software, refers to a variety of software types designed to access, damage, or steal information from systems and networks without the owner's consent.
  - Types:
    - **Viruses**: Programs that can replicate themselves and spread to other systems, often damaging files or system functionalities in the process.
    - **Worms**: Malicious programs that spread across networks and systems, exploiting vulnerabilities to replicate themselves.
    - **Trojans**: Disguised as legitimate software, these malware types create backdoors in security to allow other malware to access the system.
    - **Ransomware**: Encrypts the victim's data and demands payment for decryption keys.
    - **Spyware**: Collects information from the infected system without the user's knowledge.
    - **Keyloggers**: Capture and record user keystrokes to collect sensitive data like passwords and credit card numbers.
    - **Bots**: Automated processes that interact with other network services.
    - **Cryptojacking**: Unauthorized use of a victim's computer to mine cryptocurrency.
- **Denial-of-Service (DoS) and Distributed Denial-of-Service (DDoS) Attacks**:
  - Definition: DoS attacks overwhelm system resources, making them unavailable to legitimate users. DDoS is a form of DoS attack originating from multiple sources.
- **Social Engineering**:
  - Definition: Manipulative tactics used to trick individuals into revealing sensitive information.
- **Man-In-The-Middle (MitM) Attacks**:
  - Definition: Unauthorized interception of communication between two parties to eavesdrop or alter the communication.
- **Injection Attacks**:
  - Definition: Attacks that introduce malicious code into systems, often via input fields, to exploit vulnerabilities and gain unauthorized access.
- **Phishing**:
  - Definition: Fraudulent attempts to obtain sensitive information by masquerading as a trustworthy entity in electronic communication.
- **Botnet Attacks**:
  - Definition: Networks of compromised computers controlled by attackers to perform coordinated functions.
- **Distributed-Denial-of-Service (DDoS) Attacks**:
  - Definition: Similar to DoS attacks but coordinated from multiple compromised systems to increase the attack's effectiveness.

### Impact of Common Cyber Threats:
- **Financial Loss**: Costs associated with data breach remediation, ransom payments, or fraud.
- **Data Breach**: Unauthorized access and theft of sensitive data.
- **System or Network Downtime**: Loss of availability impacting operations and productivity.
- **Reputation Damage**: Loss of trust from customers and stakeholders following a cyber incident.
- **Legal and Regulatory Consequences**: Potential legal actions and regulatory fines due to non-compliance with data protection laws.

### Prevention Measures:
- **Awareness and Education**: Educating individuals and employees about common cyber threats and safe online practices.
- **Regular Software Updates**: Keeping systems, applications, and security software up-to-date to patch known vulnerabilities.
- **Strong Authentication**: Implementing strong passwords, two-factor authentication, and other authentication mechanisms.
- **Network Security**: Employing firewalls, intrusion detection systems, and encryption to protect network traffic.
- **Regular Monitoring and Auditing**: Continuously monitoring network traffic and auditing system logs to detect and respond to suspicious activities.
''';

class CommonCyberThreatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AttackMethodologyPage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IntroToThreatsAndAttacksPage()),
        );
      },
    );
  }
}
