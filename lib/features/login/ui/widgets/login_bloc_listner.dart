import 'package:doctor_appointment/core/helper/extension.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/features/login/logic/cubits/login/login_cubit.dart';
import 'package:doctor_appointment/features/login/logic/cubits/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/route/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading || current is LoginSuccess || current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(error,style: const TextStyle(color: Colors.white),),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
