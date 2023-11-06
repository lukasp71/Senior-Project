import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'Anonymous Browsing';
final String content = '''

Ethical Hacking

There are various methods of hacking, but there are forms of hacking which is considered Ethical. This means that this 
type of hacking is legal and for good purposes, not for stealing information maliciously and causing harm.
This is actually a profession in Cybersecurity, Ethical hackers are usually tasked with testing security systems to see if they are 
vulnerable to attacks. This usually relates to businesses. They can also use the information they find to help the business improve their
security systems in the event of a real attack. 


### Three Types of Hackers


1. White Hat Hacker:
White hat hacker usually are ethical hackers. They help businesses find weaknesses in their cyberscurity systems. They are usually provided information
beforehand to make their job a little bit easier. They use tactics like penetration testing, reconnaisance and research, and social engineering to achieve this.



2. Black Hat Hacker
These are usually the hackers who are out to do malicious intent. Hacking into businesses and companies to steal their information or get unauthorized access
to sensitive data. One famous form of this is scamming. Black hat hackers can scam companies by impersonating other people or companies to get the information they want. 

3. Grey Hat Hacker

Grey hat hackers are a mix of white and black hat hacking. They may assist businesses with security systems with or without their knowledge.
This means that they may perform some unauthorized tasks. However, it is done with non-malicious intent



## What Ethical Hackers Use

Here are some of the software tools that ethical hackers use which assist them:

1. Nmap

This tool is a network scanner which basically scans for open ports and vulnerabilities on the network you are on. This can also let you
see all devices that are connected to your network. This can do remote and local scans, and be used on computers and mobile devices. 

2. Wireshark

This is also a network scanning tool which provides relatively the same services as Nmap. It can help ethical hackers find out the traffic being exchanged between devices.
It does only let you see internet packes if they're unencrypted.


This information is provided by Kaspersky, Inc and CompTIA

For more info, see: https://www.comptia.org/content/articles/what-is-ethical-hacking
and
https://usa.kaspersky.com/resource-center/definitions/hacker-hat-types

''';




class EthicalHacking extends StatelessWidget {
  final Module module;
  final int subsectionIndex;

  EthicalHacking(this.module, this.subsectionIndex);

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