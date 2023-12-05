import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/firewall.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

const String subsectionTitle = 'Anonymous Browsing';
const String content = '''
# Browsing Anonymously

## The Basics

When surfing the web, most people may not consider their online activities being tracked. However, there are times when individuals prefer to keep their internet activities private. This leads to the practice of anonymous browsing.

## Ways to Anonymously Browse

## 1. Encrypted Communication Apps
- **Function:** These apps allow encrypted messaging, ensuring that data transmitted remains secure and private.

## 2. Encrypted Browser
- **Example:** Tor Browser encrypts your IP address and web activity, providing a higher level of anonymity.

## 3. HTTPS Websites
- **Security:** Websites starting with "https" use a secure version of the HTTP protocol, encrypting all communication between you and the website.

## 4. Use Ad-Blockers
- **Purpose:** Ad-blockers prevent ads from tracking your online behavior, such as your search history and website visits.

## 5. Check Your App Permissions
- **Privacy Check:** Regularly review the permissions of your apps to ensure they only access necessary device features.

# Conclusion

Browsing anonymously involves a combination of tools and practices to keep your online activities private. By using encrypted apps and browsers, visiting secure websites, and being mindful of app permissions and ad-trackers, you can maintain a higher level of privacy on the internet.
''';

class AnonymousBrowsing extends StatelessWidget {
  const AnonymousBrowsing({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FirewallPage()),
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
