import 'package:first_exam/screens/add_to_order_page.dart';
import 'package:first_exam/screens/home_page.dart';
import 'package:first_exam/screens/on_boarding_page.dart';
import 'package:first_exam/screens/sign_in_page.dart';
import 'package:first_exam/screens/sign_up_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const OnBoarding());
      case '/signin':
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case '/homepage':
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case '/signup':
        return MaterialPageRoute(builder: (context) => const SignUp());
      case '/add_to_order':
        return MaterialPageRoute(builder: (context) => AddToOrder(myMm: (args as Map)));
    }
  }
}