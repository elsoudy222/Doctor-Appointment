import 'package:doctor_appointment/core/di/di.dart';
import 'package:doctor_appointment/core/route/routes.dart';
import 'package:doctor_appointment/features/login/logic/cubits/login/login_cubit.dart';
import 'package:doctor_appointment/features/login/ui/login_screen.dart';
import 'package:doctor_appointment/features/onboarding/onboarding_screen.dart';
import 'package:doctor_appointment/features/sign_up/logic/sign_up_cubit.dart';
import 'package:doctor_appointment/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/screens/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
    ///=============================================///
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
        ///=============================================///
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupScreen(),
              ),
        );
    ///=============================================///
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                    child: Text('No Route Defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
