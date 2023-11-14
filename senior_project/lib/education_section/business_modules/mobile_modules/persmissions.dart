import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Historical Context of Cybersecurity';
const String content = '''

### App Permissions on Mobile Operating Systems.

## Today, most people use smartphones to make calls, take pictures, and communicate with friends
over social media. To do these things, we have applications that are pre-installed on our phones, and applications
that we must download through the operating system's application store.
When we make a social media post, for example, that social media application needs to be able to access features from your phone.
If we want to post a picture, that application needs permission from us to access our camera roll, which is storing the image we want to post. 
If our picture is located elsewhere, it needs access to the location that it is stored in to get to it.


With this, come App Permissions. Most applications ask for our permission to access things like our camera roll, our Wi-Fi settings, our GPS, and more.
With trusted apps, there aren't many issues. But if you download an unknown application onto your device, and it wants to access your location, sometimes it is best to deny it.
It is important to only allow apps you trust to access what you think is safe to share with that application.
The way these apps function with these features is very different.


There are some apps that only function if you let them access specific things about your device.




Types of Permissions:


1. Install Time Permissions

This gives the app on your phone limited access to restricted data, or perform restricted actions
that don't really affect the operating system or other apps.


2. Normal Permissions

These give access to features outside of the app's scope but are usually not a security risk or
affect other apps.

3. Signature Permissions:

This is permission granted to an app that is signed by the same certificate as the Operating System
defining it. Usually, applications that include features like VPN and autofill use signature permissions.



This information is provided by Google, Inc.


For more details on App Permissions, visit: https://developer.android.com/guide/topics/permissions/overview






''';

class AppPermissionPage extends StatelessWidget {

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
