import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

const String subsectionTitle = 'Historical Context of Cybersecurity';
const String content = '''
# App Permissions on Mobile Operating Systems

## Overview

In today's world, smartphones are integral to activities like making calls, taking photos, and using social media. These functionalities often require installing and using various applications, which in turn need access to different features of our phones.

## Understanding App Permissions

When an app needs to perform a function like posting a picture on social media, it requires permission to access specific features of your phone, such as the camera roll or storage locations.

## Importance of Caution
- **Trustworthy Apps:** Generally, well-known and trusted apps request permissions that are necessary for their functionality.
- **Unknown Apps:** Caution is advised when lesser-known apps request access to sensitive features like location settings.
- **Permission Scope:** Only grant permissions to apps when you trust them and deem it safe to share the requested information.

# Types of Permissions

## 1. Install Time Permissions
- **Description:** Grants the app limited access to restricted data or actions that don't significantly affect the operating system or other apps.

## 2. Normal Permissions
- **Scope:** Allows access to functionalities outside the app's domain but typically do not pose a security risk or impact other apps.

## 3. Signature Permissions
- **Usage:** Granted to apps signed with the same certificate as the Operating System defining it. Common in apps with features like VPN and autofill.

# Further Reading

This information is provided by Google, Inc.

For more details on App Permissions, visit: [Google Android Developers - App Permissions Overview](https://developer.android.com/guide/topics/permissions/overview)
''';

class AppPermissionPage extends StatelessWidget {
  const AppPermissionPage({super.key});

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
          MaterialPageRoute(builder: (context) => BusinessModulePage()),
        );
      },
    );
  }
}
