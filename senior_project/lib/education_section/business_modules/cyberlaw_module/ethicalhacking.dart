import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/cyberlaw_module/cyberlaw.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

const String subsectionTitle = 'Ethical Hacking';
const String content = '''
# Ethical Hacking

## Introduction

Ethical Hacking refers to legal and morally driven hacking practices, aimed at improving cybersecurity rather than causing harm or stealing information. Ethical hackers are professionals in the cybersecurity field, tasked with testing and evaluating security systems, particularly for businesses, to identify vulnerabilities.

## Three Types of Hackers

## 1. White Hat Hacker
- **Role:** Ethical hackers who assist businesses in identifying weaknesses in their cybersecurity systems.
- **Methods:** Employ techniques like penetration testing, reconnaissance and research, and social engineering.
- **Purpose:** Use their skills to improve security systems against real attacks.

## 2. Black Hat Hacker
- **Intent:** Engage in malicious activities such as unauthorized access to sensitive data and information theft.
- **Common Tactics:** Scamming by impersonating others, hacking into businesses and companies for harmful purposes.

## 3. Grey Hat Hacker
- **Nature:** A blend of both white and black hat hacking.
- **Activities:** May assist businesses in enhancing their security systems, sometimes without official authorization, but without malicious intent.

# Tools Used by Ethical Hackers

## 1. Nmap
- **Function:** A network scanner identifying open ports and vulnerabilities.
- **Capabilities:** Allows viewing of all devices on a network, supports remote and local scans, and can be used on computers and mobile devices.

## 2. Wireshark
- **Purpose:** Another network scanning tool, similar to Nmap.
- **Features:** Helps in analyzing the traffic exchanged between devices but is limited to viewing unencrypted internet packets.

## Additional Information

This content is provided by Kaspersky, Inc. and CompTIA.

For more information, visit:
- [CompTIA on Ethical Hacking](https://www.comptia.org/content/articles/what-is-ethical-hacking)
- [Kaspersky on Hacker Hat Types](https://usa.kaspersky.com/resource-center/definitions/hacker-hat-types)
''';

class EthicalHacking extends StatelessWidget {
  const EthicalHacking({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,

    );
  }
}
