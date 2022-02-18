import 'package:first_exam/core/components/size_config.dart';
import 'package:first_exam/data/user_info.dart';
import 'package:flutter/material.dart';

class ListViewBuilderItem {
  static listViewBuilderItem(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getW(10)),
      child: Column(
        children: [
          Container(
            height: getH(130),
            width: getH(130),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getH(8)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Datas.typeOfFoods[index]['image'],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: getH(5)),
            child: Text(
              Datas.typeOfFoods[index]['text'],
              style: TextStyle(
                color: Colors.black,
                fontSize: getH(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
