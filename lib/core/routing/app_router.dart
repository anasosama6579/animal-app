import 'package:animal_app/core/routing/routes.dart';
import 'package:animal_app/features/login/ui/login_screen.dart';
import 'package:animal_app/features/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{

  Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_)=> const LoginScreen()
        );
        case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_)=> const SignupScreen()
        );
      default:
        return MaterialPageRoute(
          builder: (_)=> Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}