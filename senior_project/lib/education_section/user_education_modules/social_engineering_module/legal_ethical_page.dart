import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle =
    'Legal and Ethical Considerations in Cybersecurity';
const String content =
    'The intersection of cybersecurity with legal and ethical considerations involves complex issues:\n\n'
    '1. Ethical Landscape: Cybersecurity poses ethical dilemmas between security and privacy. [Source](https://www.futureoftech.org/)\n'
    '2. Trust and Responsibility: Cybersecurity roles come with significant power and responsibility, emphasizing the need for ethical practices. [Sources](https://www.futureoftech.org/)\n'
    '3. Whistleblower’s Dilemma: The morality of exposing wrongdoing, like in Edward Snowden’s case, raises ethical questions. [Source](https://www.futureoftech.org/)\n'
    '4. Privacy vs Security: High-profile breaches highlight the ethical responsibility of organizations to protect user data against overreaching surveillance. [Source](https://www.futureoftech.org/)\n'
    '5. Navigating Ethical Dilemmas: The field requires balancing data security with respecting privacy, underlining the value of privacy and the need for accountability. [Source](https://www.futureoftech.org/)\n\n'
    'These considerations are pivotal in shaping responsible and ethical practices in cybersecurity.';

class LegalEthicalConsiderationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        // Implement forward navigation
      },
      onBackward: () {
        // Implement backward navigation
      },
    );
  }
}
