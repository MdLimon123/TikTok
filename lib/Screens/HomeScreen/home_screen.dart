import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/widgets/custom_icon.dart';

import '../../const.dart';
import 'Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            onTap: (value) {
              _homeController.pageIndex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.red,
            currentIndex: _homeController.pageIndex.value,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30.sp,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 30.sp), label: 'Search'),
              BottomNavigationBarItem(icon: CustomIcon(), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message, size: 30.sp), label: 'Message'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30.sp,
                  ),
                  label: 'Profile'),
            ]),
      ),
      body: Obx(() => _homeController.pages[_homeController.pageIndex.value]),
    );
  }
}
