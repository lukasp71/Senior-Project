// File: lib/education_section/education_modules/threats_and_attacks/incident_response_recovery_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/education_modules/threats_attacks_module/attack_methodology_page.dart';
import 'package:senior_project/education_section/education_modules/threats_attacks_module/prevention_methods_page.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'Incident Response and Recovery';
final String content = '''
### Incident Response and Recovery:

#### 1. **Introduction to Incident Response**:
   - Definition: Incident response entails a structured approach employed by organizations to address and manage the aftermath of a security breach or cyber attack, also known as an incident. The objective is to handle the situation in a manner that limits damage and reduces recovery time and costs.
   - Importance: A well-designed incident response plan can significantly mitigate the damage from an incident and accelerate the recovery of normal business operations.

#### 2. **Incident Response Life Cycle**:
   - **Preparation**: Establishing and training your incident response team, as well as equipping them with the necessary tools and resources.
   - **Identification**: Detecting and acknowledging the incident.
   - **Containment**: Short-term and long-term actions taken to prevent further damage.
   - **Eradication**: Finding and eliminating the root cause of the incident.
   - **Recovery**: Validating system functionality for business operations, and monitoring the systems for signs of weaknesses that could be exploited again.
   - **Lessons Learned**: Documenting the incident, discussing it, and learning from it to better prepare for the future.

#### 3. **Effective Practices for Cyber Incident Response and Recovery**:
   - Governance, planning and preparation, analysis, mitigation, restoration and recovery, coordination and communication, and improvement are key components to consider when developing practices for effective cyber incident response and recovery.

#### 4. **Cybersecurity Incident Recovery**:
   - Organizations are provided with strategic guidance for planning, playbook developing, testing, and improvements of recovery planning following a cybersecurity event.

#### 5. **Creating an Incident Response Plan**:
   - Step 1: Create a Policy: Establish a clear policy that defines the scope of your incident response plan.
   - Step 2: Form a Response Team: Assemble a group of individuals who will be responsible for handling incidents.
   - Step 3: Define and Classify Incidents: Establish what constitutes an incident and categorize them based on severity.
   - Step 4: Establish Notification and Escalation Procedures: Determine how incidents will be reported and who will be notified.
   - Step 5: Develop Response Procedures: Outline the steps to be taken during an incident.
   - Step 6: Training and Awareness: Ensure that all stakeholders are educated and aware of their roles and responsibilities.
   - Step 7: Testing and Maintenance: Regularly test and update the incident response plan to ensure its effectiveness.
''';

class IncidentResponseRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AttackMethodologyPage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PreventionMeasuresPage()),
        );
      },
    );
  }
}
