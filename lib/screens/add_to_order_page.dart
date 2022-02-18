import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/data/user_info.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:flutter/material.dart';

class AddToOrder extends StatefulWidget {
  Map? myMm;
  AddToOrder({Key? key, this.myMm}) : super(key: key);

  @override
  _AddToOrderState createState() => _AddToOrderState();
}

class _AddToOrderState extends State<AddToOrder> {
  late Map myM;
  @override
  void initState() {
    super.initState();
    myM = widget.myMm!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("${myM["image"]}"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.6),
                      radius: 17,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: PaddingMarginConst.kLargePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "${myM["text"]}",
                  size: FontConst.kExtraLargeFont,
                  color: ColorConst.kBlack,
                  fontWeight: WeightConst.kMediumWeight,
                ),
                const SizedBox(
                  height: 14,
                ),
                MyText(
                  text: "${myM["desc"]}",
                  size: FontConst.kMediumFont,
                  color: ColorConst.kTextSecondaryColor,
                ),
                const SizedBox(
                  height: 21,
                ),
                MyText(
                  text: "\$\$  •  Chinese  •  American  •  Deshi food",
                  size: FontConst.kMediumFont,
                  color: ColorConst.kTextSecondaryColor,
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        text: "Choise of top Cookie",
                        size: FontConst.kLargeFont),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConst.kOrangeBack,
                      ),
                      onPressed: () {},
                      child: MyText(
                        text: "REQUIRED",
                        size: FontConst.kSmallFont,
                        color: ColorConst.kOrangeBtn,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
