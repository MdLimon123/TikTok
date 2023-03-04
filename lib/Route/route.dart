import 'package:get/get.dart';
import 'package:tiktok_clone/Screens/Auth/login_screen.dart';
import 'package:tiktok_clone/Screens/Auth/signup_screen.dart';

const String login = '/login-screen';
const String signup = '/signup-screen';

List<GetPage> getPages = [
  GetPage(name: login, page: () => LoginScreen()),
  GetPage(name: signup, page: () => SignUpScreen())
];
