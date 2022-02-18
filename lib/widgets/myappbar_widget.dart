import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:flutter/material.dart';

class MyAppBar{
  static myAppBar({
    required String text,
    double? size = 18,
    FontWeight? fontWeight = FontWeight.w600,
    Color? color = Colors.black,
  }){
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorConst.kBlack),
        title: MyText(text: text, size: size!, fontWeight: fontWeight, color: color,),
      );
  }
}
