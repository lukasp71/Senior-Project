import "package:flutter/material.dart";
import 'package:senior_project/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> data = ['0', '1', '2', '3', '4'];
  String _currentName = '';
  int _currentProgress = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Text(
          'Update your Settings',
          style: TextStyle(fontSize: 18.0),
        )
      ]),
    );
  }
}
