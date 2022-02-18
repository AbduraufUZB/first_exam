import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:flutter/cupertino.dart';

class FacebookGoogle {
  static facebookGoogle() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: MyText(
              text: "Or",
              size: FontConst.kLargeFont,
              color: ColorConst.kTextSecondaryColor,
            ),
          ),
        ),
        myContainer("https://icons-for-free.com/iconfiles/png/512/facebook+logo+logo+website+icon-1320190502625926346.png", "CONNECT WITH FACEBOOK", ColorConst.kFacebook),
        const SizedBox(height: 16,),
        myContainer("https://freesvg.org/img/1534129544.png", "CONNECT WITH GOOGLE", ColorConst.kGoogle),
      ],
    );
  }
}

myContainer(String image, String text, Color color) {
    return Container(
      height: 44,
      width: 355,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: ColorConst.kWhite,
                  image: DecorationImage(
                    image: NetworkImage(
                        "$image"),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: MyText(
              text: "$text",
              size: FontConst.kMediumFont,
              color: ColorConst.kWhite,
              fontWeight: WeightConst.kMediumWeight,
            ),
          ),
        ],
      ),
    );
  }
