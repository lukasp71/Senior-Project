// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/aiandiot_module/cyberai.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

const String subsectionTitle = 'Anonymous Browsing';
const String content = '''
# IoT Device Security

## Overview

**Internet of Things (IoT) devices**, such as Smart TVs and smart appliances, are increasingly common in our daily lives. However, many of these devices are vulnerable by default, lacking built-in security features.

## Challenges with IoT Security

## Lack of Regular Updates

The primary challenge is that most users do not regularly update their smart devices, potentially missing critical security patches. It's important to check for updates and, if available, enable an "update automatically" option.

## Main Issues with IoT Security

1. **Lack of Encryption:** Many IoT devices do not support encryption, leaving the information they transmit susceptible to cyberattacks. This includes devices like security cameras and medical equipment.

2. **Outdated Protocols:** A significant number of IoT devices use older, insecure protocols, such as HTTP instead of the more secure HTTPS.

3. **Insufficient Patching:** IoT devices often do not receive necessary patches, leaving longstanding vulnerabilities.

## Mitigation Strategies

## 1. Separate Network for IoT Devices

- **Strategy:** To protect IoT devices, consider placing them on a separate network, isolated from other home devices.

## 2. Cloud-Based Security

- **Solution:** Implement cloud-based security measures to protect IoT devices at the network level, preventing attackers from reaching the devices directly.

## 3. Endpoint Encryption

- **Encryption:** Encrypting data at the endpoint can significantly enhance the security of IoT devices.

This information is provided by Fortinet, Inc.

For more information, visit: [Fortinet IoT Security](https://www.fortinet.com/resources/cyberglossary/iot-security)
''';

class IOT extends StatelessWidget {
  const IOT({super.key});

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
          MaterialPageRoute(builder: (context) => const AIinCyber()),
        );
      },
    );
  }
}
