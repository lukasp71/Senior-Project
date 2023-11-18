import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/aiandiot_module/cyberai.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

final String subsectionTitle = 'Anonymous Browsing';
final String content = '''


### IoT Device Security

Internet-Of-Things devices are used everywhere, these include your Smart TV's, smart appliances, and more.


Most of these devices are vulnerable by default, they don't really come with any security features built in.

Sometimes, manufacturers will release patches to devices to address security issues.

The main issue with this is very simple. Most people have smart appliances nowadays and forget that that device can recieve updates. 
Most people will never update their smart devices. That is why it is good for people to update when there is an update available, and see if there
is an "update automatically" option. 


## Main Issues with IoT Security

1. Most IoT devices do not support encryption, which means that the information it transmits is usually vulnerable to attacks.
IoT devices like security cameras, and even medical devices are always compromised.

2. The Protocol used in those devices are old and Insecure. The HTTP protocol is specifically used in most of the devices, and not HTTPS


3. Even though devices can be patched, IoT devices usually don't even recieve patches in the first place,
which can leave them vulnerable to attacks permanently. 




## Ways to Mitigate this

1. Have a seperate network for IoT Devices

One thing you can do so that your IoT devices don't get compromised is to put them on a completely seperate network, which
is not accessed by any other home devices.


2. Add Cloud-Based Security to your network.

  You can purchase or add a form of cloud based security to your network, which will protect those devices before an attacker can reach the device.


3. Endpoint Encryption:

This information is provided by Fortinet, Inc.

For more information, see https://www.fortinet.com/resources/cyberglossary/iot-security
''';

class IOT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusinessModulePage()),
        );
      },
      onBackward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AIinCyber()),
        );
      },
    );
  }
}
