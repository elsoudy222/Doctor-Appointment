

import 'package:doctor_appointment/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  AppRouter appRouter;
   DocApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'DocDoc App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),

      ),
    );
  }
}