import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/career_opportunity_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/key_concepts_page.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'Historical Context of Cybersecurity';
final String content = '''
### Origins
- The term "hacker" initially referred to individuals tinkering with technology or finding new ways of sharing information. One early instance of hacking occurred in 1963 when a phone system was hacked to make long-distance calls for free.

### The 1960s
- The widespread adoption of time-sharing in the '60s led to increased connectivity. Computers of the era were expensive and bulky, and time-sharing allowed multiple people to use a single large computer simultaneously, necessitating precautions to prevent unauthorized access to files and the computer itself.

### The 1970s
- ARPANET, the earliest form of the internet, was created, providing a testing ground for new technologies, including email. Although some ventures into malware development occurred, like Creeper and Reaper (the first computer worms), these were more academic exercises than malicious endeavors.

### The 1980s
- The Internet was formed in 1983, introducing more potential targets and attackers. The first "real" malware emerged during this time, along with dictionary attacks exploiting weak default credentials and decoy computer systems to trap attackers. Two major events were a hacker working for the KGB gaining access to sensitive US military documents and the creation of the Morris Worm, a significant piece of malware.

### The 1990s
- Known as the era of viruses, the '90s saw the rise of the anti-malware industry due to increased internet connectivity in households and the activities of "script kiddies" who launched attacks for fun without understanding the underlying code.

### The 2000s
- As more data became digitized, particularly monetary transactions, the scale of threats shifted. Credit-card breaches, hacktivism, and ransomware became common as malicious hackers realized the potential for financial gain from cybercrime.

### The 2010s
- The scale of threats continued to grow with increased attacks by nation-states, the deployment of cyberweapons for strategic objectives, and the activities of Advanced Persistent Threats (APTs), malicious groups capable of running extensive cyber-campaigns to infiltrate targets across multiple domains simultaneously.

The historical narrative highlights the evolution of cybersecurity from a niche field to a crucial aspect of modern society, with each era introducing new challenges and technological advancements.
''';

class HistoricalContextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CareersInCybersecurityPage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KeyConceptsPage()),
        );
      },
    );
  }
}
