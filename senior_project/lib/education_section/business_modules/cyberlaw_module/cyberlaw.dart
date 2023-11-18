import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/cyberlaw_module/ethicalhacking.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

final String subsectionTitle = 'Anonymous Browsing';
final String content = '''

## Cyber Laws and Regulations in the United States

Governments around the world have laws in place that protect our information physically and virtually. 
Here are some laws that apply to the United States:


1. Health Insurance Portability and Accountability Act (HIPAA):
This law went into affect in 1996, and basically controls who can see your medical and health information.

2. Homeland Security Act:
Passed in 2002 after the 9/11 attacks, this act established the Department of Homeland Security and new sets of 
procedures into place to protect the public. 

3. Cybersecurity Information Sharing Act (CISA):
  This law passed in 2015 encourages private companies to share their knowledge of cyber threats with the U.S government.
  While also providing liability protections for those companies. 



This information is Provided by Enterprise Engineering Solutions and Knowledgehut.com
For more details see: 
https://www.eescorporation.com/cybersecurity-laws-and-regulations-in-us/
and 
https://www.knowledgehut.com/blog/security/cyber-security-laws

''';

class LawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EthicalHacking()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusinessModulePage()),
        );
      },
    );
  }
}
