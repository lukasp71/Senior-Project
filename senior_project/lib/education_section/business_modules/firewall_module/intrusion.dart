import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/firewall.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/vpn.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Anonymous Browsing';
const String content = '''
# Intrusion Detection and Prevention System

## Overview

An Intrusion Detection and Prevention System (IDPS) continuously monitors a network or device. Upon detecting a potential threat, it alerts the administrator.

# Basic Functions of IDPS

1. **Protect Infrastructure:** Guards the technological infrastructure and sensitive data.
2. **Policy Review:** Assesses user and security policies in place.
3. **Information Gathering:** Collects data from network resources.
4. **Compliance:** Aids in meeting various compliance regulations.

# Types of Intrusion Prevention Systems

## 1. Network-based Intrusion Prevention System (NIPS)
- **Function:** Monitors wired networks for malicious traffic by analyzing network activities and protocols.
- **Deployment:** Installed at network boundaries, typically behind routers and firewalls.
- **Mechanism:** Compares network activity against a database of known attacks, blocking transmission if a match is found.

## 2. Wireless Intrusion Prevention System (WIPS)
- **Similarity:** Functions like NIPS but for wireless networks.
- **Limitation:** Primarily focuses on wireless protocols and does not delve into advanced protocols like TCP.
- **Usage:** Ideal in areas with extensive unauthorized wireless networking.

## 3. Network Behavior Analysis System (NBA)
- **Approach:** Instead of analyzing protocols, NBA systems detect threats by identifying unusual traffic patterns.
- **Use Cases:** Effective in identifying malware attacks, Distributed Denial of Service (DDoS) attacks, and more.

## 4. Host-based Intrusion Prevention System (HIPS)
- **Deployment:** Installed on a single host, typically servers holding extremely important data.
- **Monitoring:** Scrutinizes all traffic to and from the host, including logs, processes, and configuration changes.

# Conclusion

Intrusion Detection and Prevention Systems are vital in safeguarding networks and hosts against various cyber threats. Their diverse functionalities cater to different network environments and security needs.
''';

class IntrusionPage extends StatelessWidget {
  const IntrusionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VPNPage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FirewallPage()),
        );
      },
    );
  }
}
