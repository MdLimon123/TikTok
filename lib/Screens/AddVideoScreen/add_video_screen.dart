import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/ConfirmScreen/confirm_screen.dart';
import 'package:tiktok_clone/const.dart';

class AddVideoScreen extends StatelessWidget {
  AddVideoScreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ConfirmScreen(
                    videoFile: File(video.path),
                    videoPath: video.path,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showOptionDialog(context);
          },
          child: Container(
            width: 290.w,
            height: 80.h,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showOptionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () {
                  pickVideo(ImageSource.gallery, context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.image),
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Text(
                        'Gallery',
                        style: TextStyle(fontSize: 28.sp),
                      ),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickVideo(ImageSource.camera, context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.camera_alt),
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Text(
                        'Camera',
                        style: TextStyle(fontSize: 28.sp),
                      ),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.cancel),
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 28.sp),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
