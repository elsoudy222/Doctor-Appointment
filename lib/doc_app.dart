import 'package:doctor_appointment/core/route/app_router.dart';
import 'package:doctor_appointment/core/route/routes.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatefulWidget {
  final AppRouter appRouter;

  const DocApp({
    super.key,
    required this.appRouter,
  });
  @override
  State<DocApp> createState() => _DocAppState();
}

class _DocAppState extends State<DocApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'DocDoc App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: widget.appRouter.generateRoute,
      ),
    );
  }
}
