import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

final String subsectionTitle = 'Anonymous Browsing';
final String content = '''


### Employee Training

When it comes to businesses, it is important that both personal users and employees of
businesses are educated when it comes to basic cybersecurity practices. One employee's mistake could also major 
damage to the company, whether it is information that is leaked or stolen, or a device becoming compromised.
There are ways to educate your employees so that they are in the know.


1. Have Protocols in Place that also must be followed at all times.


Make sure all employees are educated on company protocols when it comes to data about your business. This must include everything, including what to do when transmitting, sharing, or even deleting very
important information. If as little as one step isn't followed properly, this can lead to the data becoming compromised.
Also, ensure that all employees are up to date on these protocols. Follow up with them with meetings, because sometimes people will lazily not read
an entire document. 

You could also try to test your employees to see if they really know all the protocols in place.



2. Ensure all passwords are strong and set to change regularly. 

Make sure all passwords being used for any company asset or site are strong. It is also best to require employees to change their passwords
after a given period of time. This period of time can be set at the boss's discretion. 


3. Ban Unauthorized Software

As a precautionary measure, you should, not allow employees to use any unauthorized software on any
corporate device. This is something that must always be enforced, and any employee that violates this rule could face
serious punishment. 

4. Policys on Company Cards

Make sure that only authorized employees have access to company cards or methods of payment. They must also not be using these company cards for purchases
outside the company scope, such as for personal use. 



5. Always Have a Backup

Require Employees to have a backup of all company data, and stored in a very secure environment. 


This information is provided by Nationwide, Inc. 
For more details, see https://www.nationwide.com/business/solutions-center/cybersecurity/train-employees
''';

class EmployeeTrainingPage extends StatelessWidget {
  final Module module;
  final int subsectionIndex;

  EmployeeTrainingPage(this.module, this.subsectionIndex);

  @override
  Widget build(BuildContext context) {
    return SubsectionPage(
      subsectionTitle,
      content,
      module,
      subsectionIndex,
    );
  }
}
