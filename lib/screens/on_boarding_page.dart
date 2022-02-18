import 'dart:async';

import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/signin");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Image(
              image: AssetImage("assets/photos/ph_first_page.png"),
            ),
          ),
        ),
        const SizedBox(height: 70),
        MyText(
            text: "Free delivery offers",
            size: FontConst.kExtraLargeFont + 6,
            fontWeight: WeightConst.kBoldWeight),
        const SizedBox(height: 20),
        MyText(
            text: "Free delivery for new customers via Apple",
            size: FontConst.kSmallFont + 4,
            color: ColorConst.kTextSecondaryColor),
        MyText(
            text: "Pay and others payment methods.",
            size: FontConst.kSmallFont + 4,
            color: ColorConst.kTextSecondaryColor),
      ],
    );
  }
}
