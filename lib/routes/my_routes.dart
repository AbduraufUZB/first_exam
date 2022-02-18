import 'package:first_exam/screens/on_boarding_page.dart';
import 'package:first_exam/screens/sign_in_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const OnBoarding());
      case '/signin':
        return MaterialPageRoute(builder: (context) => const SignInPage());
      
    }
  }
}