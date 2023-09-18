import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/screens/home/get_started.dart';
import 'package:senior_project/screens/home/home.dart';
import 'package:senior_project/screens/wrapper.dart';
import 'package:senior_project/services/auth.dart';
import 'package:senior_project/models/user.dart';
import 'firebase_options.dart';
//import 'package:senior_project/screens/home/get_started.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
        value: AuthService().user,
        catchError: (_, __) {},
        initialData: null,
        child: const MaterialApp(
          home: Wrapper(),
        ));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Home(),
  ));
}
