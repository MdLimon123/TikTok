import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 90.w,
      child: Stack(
        children: [
          Container(
            width: 70.w,
            margin: EdgeInsets.only(left: 20.w),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(14.r)),
          ),
          Container(
            width: 70.w,
            margin: EdgeInsets.only(right: 20.w),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(14.r)),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 70.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r)),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 32.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
