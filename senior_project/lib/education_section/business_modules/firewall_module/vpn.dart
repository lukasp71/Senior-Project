import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'All About Firewalls';
final String content = '''


'### Virtual Private Neworks


What is a VPN?'

A Virtual Private Network is an encrypted connection over the internet from a device to a network.

It's main purpose is to prevent eavesdroppers from listening in to your network traffic and safely
transmit sensitive data. It is very commonly used in businesses, and some personal users prefer to use
a VPN, especially if on a public network. 



### Main Types of VPNs:

1. Remote access

  This is where a device is provided with a secured connection outside of a corporate office. Also known as endpoints, and these are your
  everyday devices such as phones, laptops, or tablets. 

  2. Site to Site

  This is where a device is connected from a corporate office to branch offices over the internet. This is usually used if a direct connection is
  not possible between the office and branch.


  This information is provided by Cisco, Inc.
  For more information, see: https://www.cisco.com/c/en/us/products/security/vpn-endpoint-security-clients/what-is-vpn.html#~types-of-vpns

''';

class VPNPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ()),
        );
      },
    );
  }
}
