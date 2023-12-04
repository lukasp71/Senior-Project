// File: lib/education_section/education_modules/threats_and_attacks/encryption_fundamentals_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Fundamentals of Encryption';
const String content = '1. **Definition and Purpose of Encryption**:\n'
    '- **What Is Encryption?**: Encryption is the method of converting plain text into ciphertext to prevent unauthorized access. It is vital for data confidentiality and integrity.\n'
    '- **Purpose of Encryption**: The primary purpose is to protect digital data on computer systems or transmitted via networks.\n\n'
    '2. **Basic Principles of Encryption**:\n'
    '- **How Encryption Works**: Uses algorithms and encryption keys for encoding and decoding data. Only those with the decryption key can access encrypted data.\n'
    '- **Encryption Algorithms**: Various algorithms exist, each with specific use cases and strengths.\n\n'
    '3. **Types of Encryption**:\n'
    '- **Symmetric Encryption**: Utilizes a single key for both encrypting and decrypting data. Efficient but requires secure key management.\n'
    '- **Asymmetric Encryption (Public Key Cryptography)**: Uses two keys - a public key for encryption and a private key for decryption. Widely used in digital signatures and SSL/TLS.\n'
    '- **Hybrid Systems**: Combines symmetric and asymmetric encryption to leverage the strengths of both.\n\n'
    '4. **Use Cases of Encryption**:\n'
    '- **Secure Communications**: Implementing SSL/TLS protocols for website security.\n'
    '- **Data at Rest**: Encrypting files on disks or databases to prevent unauthorized access.\n'
    '- **Data in Transit**: Securing data across networks, as in VPNs and secure file transfers.\n'
    '- **Email Encryption**: Protecting email contents to maintain privacy.\n\n'
    '5. **Encryption Standards**:\n'
    '- **Common Encryption Standards**: Includes AES, RSA, and 3DES.\n'
    '- **Importance of Standards**: Ensures a consistent, secure method of encrypting data across platforms.';

class EncryptionFundamentalsPage extends StatelessWidget {
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
