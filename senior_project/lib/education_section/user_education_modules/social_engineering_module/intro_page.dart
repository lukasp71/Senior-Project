import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Introduction to Social Engineering Attacks';
const String content = '''
# Social Engineering in Cybersecurity

**Definition and Overview:**
Social engineering is a type of cybersecurity attack that uses deception and manipulation to convince unsuspecting users to reveal confidential information about themselves. This can include social account credentials, personal information, banking credentials, credit card details, and more. It can occur over the phone, through direct contact, or via the Internet, potentially targeting individuals or their workplaces.

**Primary Methods:**
- **Internet-Based Attacks:** These often involve email phishing, where attackers send fraudulent emails that appear legitimate to trick victims into revealing sensitive information or downloading malware.
- **Phone or In-Person Deception:** Attackers may use vishing (voice phishing) or direct interaction to deceive victims. This often involves posing as a trusted figure, such as a bank official, tech support agent, or company employee.

**Characteristics of Social Engineering Attacks:**
- **Exploiting Human Psychology:** Rather than exploiting technical vulnerabilities, these attacks leverage human emotions such as trust, fear, or curiosity.
- **Information Gathering:** Attackers may gather information about their target to make their attack more convincing. This can include details obtained from social media, company websites, or other public sources.
- **Urgency and Pressure:** Many attacks create a sense of urgency or pressure to act quickly, reducing the victim's time to think critically or verify the authenticity of the request.

**Common Types of Social Engineering Attacks:**
- **Phishing:** Attempts to steal sensitive information through fraudulent emails or messages.
- **Spear Phishing:** Highly targeted phishing attacks aimed at specific individuals or organizations.
- **Baiting:** Offering something enticing to lure victims into a trap, such as free downloads containing malware.
- **Pretexting:** Creating a fabricated scenario to obtain sensitive information, often involving elaborate stories or impersonation.

**Prevention and Protection:**
- **Education and Awareness:** Regular training for individuals and employees on identifying and responding to social engineering tactics.
- **Verification Processes:** Implementing procedures to verify the authenticity of requests for sensitive information.
- **Security Policies:** Establishing and enforcing security policies that include guidelines for handling confidential information and reporting suspicious activities.

**Further Resources:**
For more information on this topic, visit: [Digital Skills Resources](https://digitalskills.miami.edu/related-resources/index.html).
''';

class IntroToSocialEngineering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      
    );
  }
}
