import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'Definition and Importance';
final String content = '''
Definition:
Cybersecurity is about protecting digital assets, encompassing the safeguard of data and 
information systems from unauthorized access, theft, and loss. It aims to protect individuals' 
and organizations' systems, applications, computing devices, and sensitive data against a range 
of malicious digital threats. Cybersecurity ensures the confidentiality, integrity, and availability 
of information by protecting networks, devices, and data from unauthorized access or criminal use.

Importance:
Our online presence, protection of sensitive data, economic implications, and the prevention of 
cybercrime are some of the key reasons why cybersecurity is critically important. It safeguards 
various types of sensitive data, has broad economic implications, and plays a crucial role in 
protecting against malicious activities.

Key Terms:
Confidentiality, Integrity, and Availability are core principles of cybersecurity. 
Preventive, Detective, and Corrective measures are steps taken at different stages of cybersecurity 
management to protect, identify, and rectify security incidents respectively.

Cybersecurity Measures:
Preventive measures like implementing firewalls, using anti-virus software, and conducting regular 
security assessments help in preventing security incidents. Detective measures identify and react to 
security threats, while Corrective measures restore and validate system functionality after a security incident.

Challenges in Cybersecurity:
The evolving nature of threats, increasing sophistication of cyber attackers, and the expanding attack 
surface with the proliferation of devices connected to the internet presents ongoing challenges in 
maintaining effective cybersecurity.
''';

class DefinitionAndImportancePage extends StatelessWidget {
  final Module module;
  final int subsectionIndex;

  DefinitionAndImportancePage(this.module, this.subsectionIndex);

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle,
      content,
      module,
      subsectionIndex,
    );
  }
}
