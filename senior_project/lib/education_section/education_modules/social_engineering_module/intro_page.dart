// File: lib/education_section/education_modules/social_engineering/social_engineering_intro_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/educational_module_page.dart';
import 'package:senior_project/education_section/screens/education_module_overview.dart';

final String introTitle = 'Introduction to Social Engineering';
final String introContent = '''
### Introduction to Social Engineering

#### Definition:
Social Engineering encompasses a variety of malicious activities conducted to deceive individuals into revealing sensitive information. Unlike direct attacks on hardware or software, social engineering targets the human element of cybersecurity. Here are some insights into what social engineering entails:
- **Nature of Social Engineering**: At its core, social engineering is not a typical cyber attack, but rather revolves around the psychology of persuasion, targeting the mind similar to the tactics employed by traditional con men.
- **Access Mechanism**: It's a pathway for cybercriminals to access digital networks, devices, and accounts without the need for technical expertise in bypassing security controls like firewalls and antivirus software.
- **Deception and Manipulation**: Social engineering attacks leverage deception and manipulation to trick unsuspecting individuals into disclosing confidential information such as social account credentials, personal details, and financial information.
- **Human Vulnerability**: Often noted as the weakest link in cybersecurity, humans can be exploited through social engineering techniques to aid in cyber attack efforts and extraction of valuable information.
- **Techniques Utilized**: Social engineering encompasses a set of techniques widely used in orchestrating successful cyberattacks. It uniquely targets a weak component in the cybersecurity chain—the user, who unlike systems and networks, cannot be protected from social engineering by the use of tools.

#### Importance:
Understanding social engineering is crucial as it embodies a significant portion of the threats individuals and organizations face in the digital realm. Awareness and education on social engineering techniques and tactics are primary measures in building a resilient defense against such deceptive and manipulative attacks. The knowledge of how social engineering attacks are conducted, the common signs of such attacks, and the psychological principles utilized can empower individuals and organizations to establish robust protocols to identify, prevent, and respond to social engineering attempts effectively.

This introductory section aims to provide a foundational understanding of social engineering, highlighting its definition, the techniques employed, and the importance of awareness to mitigate the risks associated with it. Through this knowledge, individuals can better safeguard their personal information, and organizations can enhance their overall cybersecurity posture.

In the subsequent sections, we will delve deeper into the various social engineering techniques, psychological principles behind these attacks, real-world case studies, and preventive measures to combat social engineering threats.
''';

class SocialEngineeringIntroPage extends StatelessWidget {
  final Module module;

  SocialEngineeringIntroPage(this.module);

  @override
  Widget build(BuildContext context) {
    return ModuleIntroPage(
      moduleTitle: 'Introduction to Cybersecurity',
      introText: 'This module provides an introduction to cybersecurity...',
      onStart: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ModulePage()),
        );
      },
    );
  }
}
