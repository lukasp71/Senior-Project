// File: lib/education_section/education_modules/threats_and_attacks/encryption_practice_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle =
    'Encryption in Practice: SSL/TLS for Secure Internet Communications';
final String content =
    'SSL/TLS protocols are essential for secure internet communications. Here’s a comprehensive overview:\n\n'
    '1. **Overview of SSL/TLS**: These cryptographic protocols are foundational for internet security. They encrypt data between web servers and clients (browsers), protecting sensitive information during transmission.\n'
    '2. **How SSL/TLS Works**: It involves digital certificates for server authentication and establishing a secure connection. The encryption process protects data integrity and confidentiality against eavesdropping and tampering.\n'
    '3. **SSL/TLS Handshake Process**:\n'
    '   - Begins with a client requesting a secure connection and the server responding with its SSL certificate.\n'
    '   - The client verifies the certificate’s authenticity with the issuing Certificate Authority (CA).\n'
    '   - Once verified, the client and server agree on encryption methods and exchange keys.\n'
    '4. **Types of Keys in SSL/TLS**:\n'
    '   - Uses asymmetric encryption for the initial handshake and symmetric encryption for subsequent data transmission.\n'
    '   - This hybrid approach optimizes both security and performance.\n'
    '5. **Applications of SSL/TLS**:\n'
    '   - Beyond HTTPS, it’s used in securing email communications, online transactions, and cloud services.\n'
    '   - Essential for protecting user privacy, especially in e-commerce and online banking.\n'
    '6. **Benefits and Challenges**:\n'
    '   - Offers strong security against interception and hacking attempts.\n'
    '   - Challenges include managing certificates and ensuring compatibility across different systems and browsers.\n'
    '   - Continual updates are necessary to address emerging vulnerabilities and maintain robust security.\n'
    '7. **Implementing SSL/TLS**:\n'
    '   - Involves choosing the right type of certificate, configuring server settings, and maintaining up-to-date encryption standards.\n'
    '   - Regularly updating and renewing SSL/TLS certificates is critical for ongoing security.\n\n'
    'SSL/TLS encryption is vital in today’s digital landscape, offering robust security for a wide range of internet applications. Understanding and implementing these protocols correctly is key to safeguarding online communications.';

class EncryptionPracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        // Implement forward navigation
      },
      onBackward: () {
        // Implement backward navigation
      },
    );
  }
}
