import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Screens/AddVideoScreen/add_video_screen.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;

  List pages = [
    Text('Home Screen'),
    Text('Search Screen'),
    AddVideoScreen(),
    Text('Message Screen'),
    Text('Profile Screen')
  ];
}
