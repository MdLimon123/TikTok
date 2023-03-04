import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Route/route.dart';
import 'package:tiktok_clone/Screens/Auth/controller/auth_controller.dart';

import '../../const.dart';
import '../../widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

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
              'Register',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 25.h,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 80.r,
                  backgroundImage: const NetworkImage(
                      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                    bottom: -15.w,
                    right: 2.w,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: () {
                        authController.pickImage();
                      },
                    ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextInputField(
                  controller: _userNameController,
                  icon: Icons.person,
                  labelText: 'UserName'),
            ),
            SizedBox(
              height: 20.h,
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
              height: 20.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextInputField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  isObscure: true,
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
                  authController.register(
                      _userNameController.text,
                      _emailController.text,
                      _passwordController.text,
                      authController.profilePhoto);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'SignUp',
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
                          height: 10.h,
                          width: 10.w,
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
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(login);
                  },
                  child: Text(
                    'Login',
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
