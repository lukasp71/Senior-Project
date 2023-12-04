import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Common Social Engineering Techniques';
const String content =
    'Social engineering attacks leverage various sophisticated techniques to trick individuals into disclosing sensitive information. Key techniques include:\n\n'
    '1. Phishing: Acquiring sensitive data through deceptive messages.\n'
    '2. Scareware: Tricking users into downloading harmful software.\n'
    '3. Watering Hole: Distributing malware via compromised popular websites.\n'
    '4. Spear Phishing/Whaling: Targeted attacks on valuable individuals.\n'
    '5. Cache Poisoning/DNS Spoofing: Redirecting to malicious sites by tampering with web cache or DNS records.\n'
    '6. Pretexting: Creating fabricated scenarios to gather information.\n'
    '7. Baiting and Quid Pro Quo: Offering false promises to extract information or action.\n'
    '8. Tailgating: Bypassing security by following authorized personnel.\n\n'
    'These techniques exploit human trust, highlighting the need for awareness and vigilance. For more details on these techniques, visit: https://www.exabeam.com/information-security/social-engineering-attacks/';

class SocialEngineeringTechniquesPage extends StatelessWidget {
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
