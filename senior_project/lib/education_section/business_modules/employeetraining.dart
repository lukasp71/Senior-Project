import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';


const String subsectionTitle = 'Anonymous Browsing';
const String content = '''
# Employee Training in Cybersecurity

## Importance in Businesses

In the realm of business, the education of both personal users and employees in basic cybersecurity practices is crucial. A single mistake by an employee can lead to significant damage, including leaked or stolen information, or compromised devices. Implementing effective training methods is key to enhancing cybersecurity awareness.

# Essential Training Practices

## 1. Adherence to Protocols
- **Compliance:** Ensure all employees understand and follow company protocols regarding data handling, including transmission, sharing, and deletion.
- **Continuous Education:** Keep employees updated through meetings and reviews. Regular testing can reinforce their understanding of these protocols.

## 2. Password Management
- **Strength and Regular Changes:** Encourage the use of strong passwords and mandate regular password changes to enhance security.

## 3. Ban on Unauthorized Software
- **Strict Enforcement:** Prohibit the use of any unauthorized software on corporate devices, with clear consequences for violations.

## 4. Policies on Company Cards
- **Restricted Access:** Limit access to company payment methods to authorized personnel only. Ensure these methods are not used for personal purchases.

## 5. Data Backup
- **Mandatory Backups:** Require employees to regularly backup company data and store it in a secure environment.

## Additional Information

This content is provided by Nationwide, Inc.

For more details on employee cybersecurity training, visit: [Nationwide Cybersecurity Training for Employees](https://www.nationwide.com/business/solutions-center/cybersecurity/train-employees)
''';

class EmployeeTrainingPage extends StatelessWidget {
  const EmployeeTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
     
    );
  }
}
