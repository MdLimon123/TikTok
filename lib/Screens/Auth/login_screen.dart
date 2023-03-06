import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Route/route.dart';
import 'package:tiktok_clone/Screens/Auth/controller/auth_controller.dart';
import 'package:tiktok_clone/const.dart';
import 'package:tiktok_clone/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tiktok Clone',
              style: TextStyle(
                  fontSize: 35.sp,
                  color: buttonColor,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextInputField(
                  controller: _emailController,
                  icon: Icons.email,
                  labelText: 'Email'),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextInputField(
                  isObscure: true,
                  controller: _passwordController,
                  icon: Icons.lock,
                  labelText: 'Password'),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50.h,
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(8.r)),
              child: InkWell(
                onTap: () {
                  authController.loginUser(
                      _emailController.text, _passwordController.text);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Obx(
                      () => SizedBox(
                        width: authController.isLoading.value ? 10.w : 0,
                      ),
                    ),
                    Obx(() {
                      if (authController.isLoading.value) {
                        return SizedBox(
                          height: 15.h,
                          width: 20.w,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(signup);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20.sp, color: buttonColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
