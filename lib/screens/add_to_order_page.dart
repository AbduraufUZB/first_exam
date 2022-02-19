import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:first_exam/core/components/size_config.dart';
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
  String radioValue = UserInfo.dataRadio[1];

  String radioValue2 = UserInfo.dataRadio[0];

  int _counter = 1;
  double _finalPrice = 11.98;

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
                _myRow("Choice of top Cookie"),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children:
                      UserInfo.dataRadio.map((e) => _myRadioButton(e)).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                _myRow("Choice of bottom Cookie"),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: UserInfo.dataRadio
                      .map((e) => _myRadioButton(e, secondary: true))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        text: "Add Special Instructions",
                        size: FontConst.kMediumFont),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: PaddingMarginConst.kExtraLargePadding,
                  child: _mySecondRow(),
                ),
                ElevatedButton(
                  child: MyText(
                    text: "ADD TO ORDER (\$${_finalPrice.toStringAsFixed(2)})",
                    size: 14,
                    color: ColorConst.kWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: ColorConst.kPrimaryColor,
                      padding: EdgeInsets.symmetric(horizontal: getW(80))),
                  onPressed: () {
                    showMyDialog();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showMyDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Great Job !!!',
      desc:
          'Products have purchased successfully! \n Your Total Price: \$ ${_finalPrice.toStringAsFixed(2)}',
      btnOkOnPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/homepage", (route) => false);
      },
    ).show();
  }

  _mySecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        plusMinusButton(false),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(15.0)),
          child: Text(
            "$_counter",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: getH(25)),
          ),
        ),
        plusMinusButton(true),
      ],
    );
  }

  Widget _myRadioButton(e, {bool? secondary = false}) {
    return SizedBox(
        height: 60,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Radio(
                      activeColor: ColorConst.kPrimaryColor,
                      value: "$e",
                      groupValue: secondary == true ? radioValue2 : radioValue,
                      onChanged: (v) {
                        setState(() {
                          secondary == true
                              ? radioValue2 = "$e"
                              : radioValue = "$e";
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: MyText(text: e, size: FontConst.kMediumFont),
                  ),
                ],
              ),
            ),
            const Divider()
          ],
        ));
  }

  _myRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(text: text, size: FontConst.kLargeFont),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConst.kOrangeBack,
          ),
          onPressed: () {},
          child: MyText(
            text: "REQUIRED",
            size: FontConst.kExtraSmallFont + 3,
            color: ColorConst.kOrangeBtn,
          ),
        ),
      ],
    );
  }

  plusMinusButton(bool isAdd) {
    return InkWell(
      child: CircleAvatar(
        radius: 27.0,
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        child: Icon(
          isAdd ? Icons.add : Icons.remove,
          color: Colors.black,
        ),
      ),
      onTap: () {
        if (isAdd) {
          setState(() {
            _counter++;
            _finalPrice = 11.98 * _counter;
          });
        } else if (_counter <= 1) {
          setState(() {
            _counter = 1;
            _finalPrice = 11.98;
          });
        } else {
          setState(() {
            _counter--;
            _finalPrice = 11.98 * _counter;
          });
        }
      },
    );
  }
}
