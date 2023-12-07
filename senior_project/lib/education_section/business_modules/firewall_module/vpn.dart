import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/intrusion.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

const String subsectionTitle = 'All About Firewalls';
const String content = '''
# Virtual Private Networks (VPNs)

## What is a VPN?

A Virtual Private Network (VPN) is an encrypted connection over the internet from a device to a network. Its primary purpose is to secure network traffic from eavesdropping and to transmit sensitive data safely. VPNs are widely used in businesses and are also popular among personal users, particularly when using public networks.

# Main Types of VPNs

## 1. Remote Access
- **Description:** Provides a secure connection for a device outside of a corporate office.
- **Endpoints:** Commonly used devices include phones, laptops, or tablets.
- **Use Case:** Allows employees to access their company's network securely from remote locations.

## 2. Site to Site
- **Function:** Connects a device from a corporate office to branch offices over the internet.
- **Application:** Ideal when a direct connection between the main office and branch offices is not feasible.

# Additional Information

This content is provided by Cisco, Inc.

For more information on VPNs, visit: [Cisco on VPNs](https://www.cisco.com/c/en/us/products/security/vpn-endpoint-security-clients/what-is-vpn.html#~types-of-vpns)
''';

class VPNPage extends StatelessWidget {
  const VPNPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      
    );
  }
}
