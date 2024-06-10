import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:doctor_appointment/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:doctor_appointment/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:doctor_appointment/features/onboarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0.h,bottom: 30.0.h),
            child:  Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 20.h,),
                const DoctorImageAndText(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
                  child:  Column(
                    children: [
                      Text(
                          "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        style: TextStyles.font13GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.h,),
                      const GetStartedButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
