import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/historical_content_page.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/education_module_overview.dart';

const String subsectionTitle = 'Section 1.4: Careers in Cybersecurity';
const String content = '''
### Entry-Level Jobs
- **Information Security Analyst:** Help protect an organization's computer networks and systems by investigating, documenting, and reporting security breaches.

### Common Career Paths
1. **Engineering:** Focus on building secure systems and applications.
2. **Incident Response:** Deal with security incidents and breaches.
3. **Management:** Oversee cybersecurity operations and teams.
4. **Consulting:** Provide cybersecurity advice to organizations.
5. **Testing and Hacking (Ethical Hacking):** Identify vulnerabilities in systems and networks.

### Job Example
- **Cybersecurity Engineer:** 
   - **Average Annual Salary:** Over \$99,000.
   - **Education Needed:** Bachelor’s degree in computer science, information technology, systems engineering, or a closely related field.

### Salary Overview
- **Entry-Level:**
  - **Cybersecurity Analyst:** \$81,321.
  - **System Administrator:** \$78,387.
- **Mid-Level:**
  - **Penetration Tester:** Salary data not provided.

### Career Advancement
- There are numerous opportunities for workers to start and advance their careers within cybersecurity. A variety of roles are available, each with its own set of required skills, credentials, and associated salaries. Transitioning between different cybersecurity roles is also common, allowing for a dynamic and rewarding career path.
''';

class CareersInCybersecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ModulePage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoricalContextPage()),
        );
      },
    );
  }
}
