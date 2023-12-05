// File: lib/education_section/education_modules/threats_and_attacks/attack_methodology_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/common_threats_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/incident_response_page.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Attack Methodology';
const String content = '''
# Attack Methodology:

## 1. **Attack Stages (Cyber Kill Chain):**
   - **Reconnaissance:** Identifying targets and gathering information.
   - **Weaponization:** Creating a weapon like malware to exploit a vulnerability.
   - **Delivery:** Transmitting the weapon to the targeted system.
   - **Exploitation:** Exploiting a vulnerability in the targeted system.
   - **Installation:** Installing malware in the exploited system.
   - **Command and Control:** Establishing a command channel to control malware.
   - **Actions on Objectives:** Achieving the attacker's goals like data theft.

## 2. **Common Cyber Attack Methods:**
   - **Compromised Credentials:** Due to weak or stolen credentials, which account for over 80% of breaches globally.
   - **Malicious Insiders:** Attacks carried out by authorized individuals within the organization.
   - **Misconfiguration:** Such as misconfigured databases leading to data exposure.
   - **Phishing:** Deceptive emails tricking recipients into revealing sensitive information or installing malware.
   - **Trust Relationships:** Exploiting connections with third-party organizations or supply chain partners.
   - **Zero-Day Vulnerabilities:** Unknown security vulnerabilities exploited before a patch is available.

## 3. **Cyber Attack Techniques:**
   - **Cross-Site Scripting:** Stealing session IDs to hijack sessions.
   - **Denial of Service:** Disrupting authorized user access to systems.
   - **Logical Bomb:** Code auto-execution under certain conditions, causing damage or data theft.
   - **Sniffing:** Capturing and analyzing network traffic to steal data or credentials.
   - **Trojan Horse, Virus, Worm:** Various malware types each with different propagation and payload delivery methods.
   - **Spam and Botnets:** Distributing malicious content or coordinating attacks across compromised systems.

## 4. **Attack Vectors:**
   - **Malware Sharing:** Distributing malware via email attachments, web links, or other media.
   - **Exploiting System Vulnerabilities:** Taking advantage of system weaknesses to gain unauthorized access.
''';

class AttackMethodologyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IncidentResponseRecoveryPage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommonCyberThreatsPage()),
        );
      },
    );
  }
}
