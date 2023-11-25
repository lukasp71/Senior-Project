import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/aiandiot_module/iOT.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';

const String subsectionTitle = 'Anonymous Browsing';
const String content = '''

AI and Machine Learning in Cybersecurity

In the modern age, Artificial Intelligence and Machine Learning have been able to help us with all kinds of technology, and now it can
help us with Cybersecurity. There are obstacles that humans have had to overcome with Cybersecurity, and AI is helping us
overcome that. Here are some ways:

1. Human Error in Configuration:

This is a very common issue ran into by almost any company. When confuguring some sort of system, whether it is for security or not
a mistake is made, or something is overlooked which ends up making them vulnerable to attacks and breaches.
AI can help us do a lot of automated tasks, which allows teams to get up-to-date information on new issues, and have them
automatically resolved.

2. Threat Response Time:

The most important thing in a Cyber attack is being able to respond to it promptly. Nowadays, machine learning can aid us
by pulling information from the attack and quickly analyzing it in order to give security teams information on the attack. It 
can also provide advice to prevent further damage and stop further attacks.

## What Machine Learning Can Do For Us:

  ##Data Classifying:
  Uses rules that are predetermined to assigned to data points.

  ##Data Clustering
  Takes outliers from preset rules and places it into collections of data with similarities or oddities.
  
  ##Predictive forecasting:
  Predicts potential outcomes by analyzing existing datasets, and this can be used for various endpoint solutions.
  

## The Future of Cybersecurity

While AI and Machine Learning can help us improve our cybersecurity practices, there are some legal aspects that need to be addressed in the
future regarding AI.

1. Data Privacy Laws

Machine Learning works with datasets in order to create models, one issue is having human identifiers can violate some privacy laws.
One way this could be addressed is to make the data points anonymous, and making the data impossible to access once the software's been trained with AI.


2. Lack of Knowledgeable Experts

As AI and Machine learning are very new, there also is not a huge industry of knowledgeable experts in the field who can assist and also provide fixes
and debugging when needed. Global demand is increasing significantly, and people need to be ready. 
That said, you should still have a team on deck dedicated to security, just because we have AI does not mean you should completely rely on it.

This information was provided by Kaspersky, Inc.

For more information, see: https://usa.kaspersky.com/resource-center/definitions/ai-cybersecurity

''';

class AIinCyber extends StatelessWidget {
  const AIinCyber({super.key});

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle: subsectionTitle,
      content: content,
      onForward: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const IOT()),
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
