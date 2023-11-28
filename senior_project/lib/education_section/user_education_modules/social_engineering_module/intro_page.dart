import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Introduction to Social Engineering Attacks';
const String content =
    'Social engineering is a type of cybersecurity attack that '
    'uses deception and manipulation to convince unsuspecting users to reveal confidential '
    'information about themselves, such as social account credentials, personal information, '
    'banking credentials, credit card details, and more. It can occur over thxe phone, through '
    'direct contact, or via the Internet, potentially targeting individuals or their workplaces. '
    'Many social engineering attacks aim to deceive a victim into installing malicious software '
    'on their device, thereby gaining full control over the targeted computer and using it to '
    'spread the infection further within the network. Adversaries often find it easier to exploit '
    'human errors than system vulnerabilities, making these attacks particularly devastating due '
    'to the unpredictable nature of human behavior against such deceptive tactics. There are primarily '
    'two deployment methods for social engineering attacks: via the Internet, with email being the most '
    'common, and through phone or in-person deception. Attackers may use both methods to gain useful '
    'insight into their target before launching a full-scale attack.'
    'For more information on this topic, visit: https://digitalskills.miami.edu/related-resources/index.html';

class IntroToSocialEngineering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        // TODO: Implement forward navigation
      },
      onBackward: () {
        // TODO: Implement backward navigation
      },
    );
  }
}
