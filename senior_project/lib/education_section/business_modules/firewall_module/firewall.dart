import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/anonymous.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/intrusion.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'All About Firewalls';
const String content = '''
# What is a Firewall?

## Introduction

A Firewall is a crucial security device, either physical or virtual, that serves as the first line of defense against malicious activity on your network and system.

## Key Functions

- **Barrier Creation:** Firewalls establish barriers between secured and controlled internal networks, distinguishing between trusted and untrusted ones.
- **Deployment:** They can be implemented in various forms including private/public cloud, hardware, software, or Software as a Service (SaaS).
- **Built-in Firewalls:** Most modern computers have firewalls built into their operating systems, requiring minimal user intervention for basic functioning.

## Types of Firewalls

## 1. Next Generation Firewall
- **Features:**
  - Intelligence-based access control with stateful inspection.
  - Integrated intrusion prevention system (IPS).
  - Application awareness and control to see and block risky apps.
  - Upgrade paths to include future information feeds.
  - Techniques to address evolving security threats.
  - URL filtering based on geolocation and reputation.
- **Standards:** Defined by Gartner, Inc., a next-generation firewall must include the above features.

## 2. Virtual Firewall
- **Deployment:** Usually deployed in private clouds like Azure, Amazon Web Services, etc.
- **Function:** Monitors and secures traffic across both physical and virtual networks, preventing unauthorized access.

## 3. Unified Threat Management (UTM) Firewall
- **Combination:** Integrates a traditional firewall with intrusion prevention and an antivirus.
- **Goal:** Offers simplicity and ease of use while providing comprehensive protection.

# Additional Information

This content is provided by Cisco, Inc.

For more information about firewalls, visit: [Cisco Firewalls Explained](https://www.cisco.com/c/en/us/products/security/firewalls/what-is-a-firewall.html)
''';

class FirewallPage extends StatelessWidget {
  const FirewallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const IntrusionPage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnonymousBrowsing()),
        );
      },
    );
  }
}
