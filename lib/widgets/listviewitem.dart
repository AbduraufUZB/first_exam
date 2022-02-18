import 'package:first_exam/core/components/size_config.dart';
import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/data/user_info.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:flutter/material.dart';

class ListViewItem {
  static listViewItem(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getW(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getH(200),
            width: getH(250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getH(8)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Datas.newRestaurants[index]['image'],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: getH(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(
                    text: Datas.newRestaurants[index]['text'],
                    size: getH(24),
                    color: ColorConst.kTextSecondaryColor),
              ],
            ),
          ),
          MyText(
              text: "Colorodo, San Francisco",
              size: getH(20),
              color: ColorConst.kTextSecondaryColor),
        ],
      ),
    );
  }
}
