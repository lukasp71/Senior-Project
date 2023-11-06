import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'All About Firewalls';
final String content = '''

### What is a Firewall?

- A Firewall is a security device, physical or virtual, which acts as a first line of defense
 if something malicious is detected on your network and system. 
 
 - Firewalls create barries between secured and controlled internal networks that are trusted or untrusted.

 - Firewalls can be implemented as a private or public cloud, hardware, software, or even
 software as a service. 

 - Most computers today already have a firewall built into their operating system. So no additional work is needed by the user to ensure it is functioning properly.
 In the everyday world, you are generally safe, but if you're working in a business or on a machine with much more confidential and sensitive data, it is best to have additional firewalls,
 just in case. 

 ### Examples of Firewalls

 1. Next Generation Firewall
 This is a modern firewall used to block attacks and threats that are much newer in today's world that may have
 not been seen before. These firewalls even have standards, provided by Gartner, Inc. They state that a next-generation
 firewall has to include the following:
  •	Intelligence-based access control with stateful inspection
•	Integrated intrusion prevention system (IPS)
•	Application awareness and control to see and block risky apps
•	Upgrade paths to include future information feeds
•	Techniques to address evolving security threats
•	URL filtering based on geolocation and reputation

2. Virtual Firewall

  This is a firewall which is usuallt deployed virtually into a private cloud like Azure, Amazon Web Services, and more.
  This firewall monitors and secures traffic across both physical and virtual networks, to ensure no unknown outsider can 
  maliciously access the cloud and cause harm


3. Unified Threat Management (UTM) Firewall:
  UTM Firewalls combine a traditional firewall with intrusion prevention and an antivirus.
  The main goal of this firewall is to be simple and easy to use, while providing sufficient protection.


This information is provided by Cisco, Inc. 
For more information about firewalls, go to: https://www.cisco.com/c/en/us/products/security/firewalls/what-is-a-firewall.html

''';
class FirewallPage extends StatelessWidget {
  final Module module;
  final int subsectionIndex;

  FirewallPage(this.module, this.subsectionIndex);

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
