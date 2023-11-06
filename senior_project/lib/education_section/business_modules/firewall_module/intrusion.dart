import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'Anonymous Browsing';
final String content = '''


## Intrusion Detection and Prevention System

A system which is constantly monitoring your network or device, and when a possible threat is detected, it alerts
the administrator.


## Basic Functions of this System

1. It guards the infrastructure of the technology and any sensitive data

2. It reviews user and security policies already in place.

3. Gathers info from network resources

4. Helps meet compliance regulations.


## Different types of Intrusion Prevention Systems


1. Network-based intrusion prevention system (NIPS):

This system usually monitors wireless networks by analyzing networks or network segments for malicious traffic. Usually, it analyzes protocol activity and
sees if it matches a database of known attacks. If so, the data will not transmit. NIPS are installed at network boundaries, and behind routers and firewalls.

2. Wireless Intrusion Prevention System:

This is basically NIPS, but wireless. It analyzes wireless protocols, but it does not
analyze more advanced ones like TCP. This is used in any area that has more unauthorized wireless networking.

3. Network behavior analysis system: 
While NIPS analyze protocol activity, NBA systems identify threats by looking for traffic patterns that are unusual. This can happen with malware attacks, DDoS attacks,
and more. 


4. Host based intrusion prevention system. 

This system is deployed in a single host, and are servers that have extrmeley important data on them. This system monitors
all traffic going in and out of that host, and monitors it in any way possible, including logs, processes, and configuration changes. 

''';
class LawPage extends StatelessWidget {
  final Module module;
  final int subsectionIndex;

  LawPage(this.module, this.subsectionIndex);

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
