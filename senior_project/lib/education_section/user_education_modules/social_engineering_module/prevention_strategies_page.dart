import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle =
    'Prevention and Protection Strategies Against Social Engineering';
const String content =
    'Protecting against social engineering involves several key strategies:\n\n'
    '1. **Check the Source**: Verify the origin of communications, examine email headers, URLs, and look for spelling errors. Contact official representatives for verification.\n'
    '2. **What Do They Know?**: Be cautious if a caller or email lacks information they should have, like your full name.\n'
    '3. **Break the Loop**: Recognize and pause when confronted with urgency, a common tactic in social engineering.\n'
    '4. **Ask for ID**: Always verify identities and check credentials before sharing any private data.\n'
    '5. **Use a Good Spam Filter**: Employ effective email filters to weed out suspicious links or content.\n'
    '6. **Is This Realistic?**: Assess the realism of unexpected or unlikely scenarios.\n'
    '7. **Don\'t Go Too Fast**: Slow down and use different communication methods to verify sources.\n'
    '8. **Secure Your Devices**: Keep your software updated, use robust passwords, and enable two-factor authentication.\n'
    '9. **Think About Your Digital Footprint**: Be cautious about sharing personal information online, adjust social media settings, and be mindful of details shared on online resumes and networks.\n\n'
    'Implementing these steps will help you identify and thwart social engineering attempts, protecting both personal and professional information.';

class PreventionStrategiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
     
    );
  }
}
