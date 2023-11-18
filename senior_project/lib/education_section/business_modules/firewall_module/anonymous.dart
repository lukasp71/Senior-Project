import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/firewall.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

final String subsectionTitle = 'Anonymous Browsing';
final String content = '''

### Browsing Anonymously


## - The Basics

When surfing the web, most people don't really think about other people knowing what they are doing
on the internet, but sometimes, people don't really want any record of what they are doing on the internet 
out there. This is where people anonymously browse. 

##Ways to Anonymously Browse:

1. Encrypted Communication Apps

  Some apps that you can download allow you to message each other, and the data transmitted between the
  two of you remains encrypted the whole time. 


2. Encrypted Browser

  Some internet browsers encrypt your IP address and web activity. One of these is Tor Browser. 


3. HTTPS Websites:

Most secured websites begin with "https" which is a secure version of the http protocol. Websites with this header
encrypt all communication between you and that website. 

4. Use Ad-Blockers

  Ads that show up in apps or websites sometimes automatically track you without you even knowing. These ads track things like what you're searching 
  for, and what you are visiting. 

  5. Check Your App Permissions

  Make sure the apps you are using only use the features of your device it REALLY needs. 
''';

class AnonymousBrowsing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirewallPage()),
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
