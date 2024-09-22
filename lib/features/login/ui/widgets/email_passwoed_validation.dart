import 'dart:collection';

import 'package:doctor_appointment/core/helper/app_regex.dart';
import 'package:doctor_appointment/features/login/logic/cubits/login/login_cubit.dart';
import 'package:doctor_appointment/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPasswordValidation extends StatefulWidget {
  const EmailAndPasswordValidation({super.key});

  @override
  State<EmailAndPasswordValidation> createState() =>
      _EmailAndPasswordValidationState();
}

class _EmailAndPasswordValidationState
    extends State<EmailAndPasswordValidation> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength  = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          // Email:
          AppTextFormField(
            hintText: "Email",
            controller: context.read<LoginCubit>().emailController,
            validator: (String? value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return "Please Enter Valid Email";
              }
            },
          ),
          verticalSpace(18),
          // Password:
          AppTextFormField(
            hintText: "Password",
            controller: context.read<LoginCubit>().passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                color: ColorManager.mainBlue,
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Valid Password";
              }
            },
          ),
          verticalSpace(24),
          // Forgot Password:
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot Password?',
              style: TextStyles.font13BlueRegular,
            ),
          ),
          verticalSpace(24),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  /// dispose password controller when not in use
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
