// File: lib/education_section/education_modules/threats_and_attacks/case_studies_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Case Studies of Social Engineering Attacks';
const String content =
    'These real-world case studies illustrate the varied tactics used in social engineering:\n\n'
    '1. \$100 Million Google and Facebook Scam: Evaldas Rimasauskas fraudulently obtained over \$100 million by sending phishing emails to Google and Facebook employees. [Source](https://www.tessian.com/blog/real-life-examples-of-social-engineering-attacks/)\n'
    '2. US Department of Labor Attack: Attackers imitated the US Department of Labor to steal Office 365 credentials, inviting victims to bid on a fake government project. [Source](https://www.tessian.com/blog/real-life-examples-of-social-engineering-attacks/)\n'
    '3. Russian Group Targets Ukraine: The Gamaredon group used spear phishing emails containing malware to target Ukrainian government agencies and NGOs. [Source](https://www.tessian.com/blog/real-life-examples-of-social-engineering-attacks/)\n'
    '4. Deepfake Attack on UK Energy Company: A CEO was duped into transferring \$243,000 due to a phone call using deepfake technology. [Source](https://www.tessian.com/blog/real-life-examples-of-social-engineering-attacks/)\n'
    '5. \$60 Million CEO Fraud at FACC: Scammers impersonated executives at Chinese manufacturer FACC, leading to a \$60 million loss due to fraudulent fund transfers. [Source](https://www.tessian.com/blog/real-life-examples-of-social-engineering-attacks/)\n\n'
    'These cases underscore the importance of vigilance and proactive measures in cybersecurity.';

class CaseStudiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
    
    );
  }
}
