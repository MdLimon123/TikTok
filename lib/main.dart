import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:tiktok_clone/Route/route.dart';
import 'package:tiktok_clone/Screens/Auth/controller/auth_controller.dart';
import 'package:tiktok_clone/Screens/Auth/signup_screen.dart';
import 'package:tiktok_clone/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              title: 'TikTok Clone',
              builder: (context, child) => ResponsiveWrapper.builder(child,
                  maxWidth: 1200,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(480, name: MOBILE),
                    const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                  ],
                  background: Container(color: const Color(0xFFF5F5F5))),
              theme: ThemeData.dark()
                  .copyWith(scaffoldBackgroundColor: backgroundColor),
              debugShowCheckedModeBanner: false,
              initialRoute: signup,
              getPages: getPages,
              home: SignUpScreen());
        });
  }
}
