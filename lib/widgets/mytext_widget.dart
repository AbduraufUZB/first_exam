import 'package:first_exam/core/constants/const.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String text = "";
  double size = 14;
  FontWeight? fontWeight = WeightConst.kNormalWeight;
  Color? color = ColorConst.kBlack;
  MyText(
      {required this.text, required this.size, this.fontWeight, this.color}) {}

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
