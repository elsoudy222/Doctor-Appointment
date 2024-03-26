

import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{

  static TextStyle font24Black700Weight = TextStyle(
    color: Colors.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font32BlueBold = TextStyle(
    color: ColorManager.mainBlue,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font13GreyRegular = TextStyle(
    color: ColorManager.grey,
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
}