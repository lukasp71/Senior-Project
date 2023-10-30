// File: lib/education_section/education_modules/malware/prevention_and_remediation_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/malware_spread_page.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/education_module_overview.dart';

final String subsectionTitle = 'Prevention and Remediation';
final String content = '''
### Prevention:

1. **Traditional Antivirus Limitations**: 
   - Traditional antivirus solutions have limitations as they may be blind to certain malware formats like zip and may fail to catch advanced threats involving social engineering tactics.

2. **Anti-Malware Solutions**:
   - Deploy an anti-malware solution on workstations to prevent spyware, adware, and malware as part of the OS security baseline.
   - Ensure that the anti-malware solution remains up-to-date and monitor antivirus scan results on a regular basis.
   - Create a secure system baseline image and deploy it to all servers.

3. **Safe Browsing Habits**:
   - Be cautious with email attachments and links from unknown sources.
   - Avoid visiting suspicious websites.
   - Keep your operating system and software updated to the latest versions.

4. **Safe Mode Operation**:
   - In case of a suspected malware infection, restart the computer in Safe Mode with Networking to operate with a minimal set of drivers and services, making it easier to remove malicious software.

### Remediation:

1. **Reporting and Detection**:
   - Report suspected malware and related vulnerabilities.
   - Employ scanning and detection mechanisms to identify malware.

2. **Containment and Eradication**:
   - Contain and eradicate malware to prevent further spread and damage.

3. **System Restoration**:
   - Correct system changes caused by malware, for instance, removing threats from an infected system.
   - The goal is to remediate threats before they cause any further damage.

4. **Regular Monitoring**:
   - Regular monitoring of network and system activities to spot and address anomalies that could be indicative of malware infections.

5. **Education and Training**:
   - Educate users and employees on recognizing phishing attempts and other malicious activities to prevent malware infections.
''';

class PreventionAndRemediationPage extends StatelessWidget {
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
          MaterialPageRoute(builder: (context) => HowMalwareSpreadsPage()),
        );
      },
    );
  }
}
