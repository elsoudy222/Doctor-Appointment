
import 'package:doctor_appointment/core/route/routes.dart';
import 'package:doctor_appointment/features/login/ui/login_screen.dart';
import 'package:doctor_appointment/features/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{

  Route generateRoute(RouteSettings settings){

    switch(settings.name){
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
        default:
          return MaterialPageRoute(
            builder: (_) =>  Scaffold(
              body: Center(
                child: Text('No Route Defined for ${settings.name}'),
              ),
            ));
    }
  }

}