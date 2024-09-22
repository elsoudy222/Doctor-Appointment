import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/widgets/app_text_form_field.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:doctor_appointment/features/login/ui/widgets/email_passwoed_validation.dart';
import 'package:doctor_appointment/features/login/ui/widgets/login_bloc_listner.dart';
import 'package:doctor_appointment/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubits/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Form(
                  // key: formKey,
                  child: Column(
                    children: [
                      const EmailAndPasswordValidation(),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText(),
                      const LoginBlocListener(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
