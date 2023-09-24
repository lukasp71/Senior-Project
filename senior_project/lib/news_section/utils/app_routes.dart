import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:senior_project/news_section/screens/home_page.dart';
import 'package:senior_project/news_section/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const initial = '/splashScreen';
  static final routes = [
    GetPage(
        name: '/splashScreen',
        page: () => const SplashScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/homePage',
        page: () => HomePage(),
        transition: Transition.fadeIn),
  ];
}
