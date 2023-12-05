// File: lib/education_section/education_modules/threats_and_attacks/encryption_types_page.dart

import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

const String subsectionTitle = 'Types of Encryption Algorithms';
const String content =
    '### Understanding different encryption algorithms is crucial in cybersecurity. Here’s an expanded overview:\n\n'
    '# 1. **Symmetric Encryption Algorithms**:\n'
    '   - **AES (Advanced Encryption Standard)**: Widely used for its speed and security, ideal for encrypting large volumes of data.\n'
    '   - **DES (Data Encryption Standard)**: Older and less secure due to a shorter key length.\n'
    '   - **Diffie-Hellman Key Exchange**: A method for secure key exchange over public channels, not direct encryption.\n\n'
    '# 2. **Asymmetric Encryption Algorithms**:\n'
    '   - **RSA Encryption**: Creates public and private keys for secure data transmission. Involves large prime numbers and modular arithmetic.\n'
    '   - **Security of RSA**: Relies on the difficulty of factoring the product of two large prime numbers, secure with large keys.\n'
    '   - **RSA Key Generation**: Selects large prime numbers for key calculations.\n\n'
    '# 3. **Comparing Strengths and Weaknesses**:\n'
    '   - **AES**: Fast and secure, best for large data sets.\n'
    '   - **DES**: Less secure, susceptible to brute-force attacks.\n'
    '   - **RSA**: Highly secure but slower, often used with symmetric methods.\n\n'
    '# 4. **Challenges and Limitations**:\n'
    '   - RSA is secure but has potential vulnerabilities, requiring specific conditions for cracking.\n'
    '   - Practicality: Often used alongside symmetric methods for efficiency.\n\n'
    'These algorithms are vital for digital communications and data security. Each has unique use cases, balancing speed, security, and efficiency.';

class EncryptionTypesPage extends StatelessWidget {
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
