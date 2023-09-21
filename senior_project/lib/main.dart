import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/news_section/screens/get_started.dart';
import 'package:senior_project/news_section/screens/home.dart';
import 'package:senior_project/database/screens/wrapper.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/database/models/user.dart';
import 'package:senior_project/news_section/utils/app_routes.dart';
import 'package:senior_project/news_section/utils/app_themes.dart';
import 'database/firebase_options.dart';
//import 'package:senior_project/screens/home/get_started.dart';

/*class MyApp extends StatelessWidget {
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
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.appTheme,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
