import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/data/user_info.dart';
import 'package:first_exam/widgets/myappbar_widget.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool myIconBool = false;
  IconData myIcon = Icons.do_not_disturb;
  Color color = Colors.red;

  bool obscureText = true;
  IconData myPassIcon = Icons.visibility;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.myAppBar(text: "Sign in"),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: PaddingMarginConst.kMediumPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
              text: "Welcome to",
              size: FontConst.kExtraLargeFont + 10,
              fontWeight: WeightConst.kMediumWeight),
          MyText(
            text:
                "Enter your Phone number or Email\naddress for sign in. Enjoy your food :)",
            size: FontConst.kMediumFont,
            color: ColorConst.kTextSecondaryColor,
          ),
          const SizedBox(
            height: 34,
          ),
          TextFormField(
            controller: _emailController,
            onChanged: (txt) {
              _changeIcon(txt);
              setState(() {});
            },
            cursorColor: ColorConst.kTextSecondaryColor,
            decoration: InputDecoration(
              suffix: Icon(
                myIcon,
                color: color,
                size: 15,
              ),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "EMAIL ADDRESS",
                    size: 15,
                    fontWeight: WeightConst.kLargeWeight,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              validator: (txt) {
                if (!myIconBool) {
                  return "There is no such account!";
                }
              },
              key: _formKey,
              obscureText: obscureText,
              controller: _passwordController,
              onChanged: (txt) {
                setState(() {});
              },
              cursorColor: ColorConst.kTextSecondaryColor,
              decoration: InputDecoration(
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    myPassIcon,
                    size: 15,
                  ),
                ),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: "PASSWORD",
                      size: 15,
                      fontWeight: WeightConst.kLargeWeight,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: MyText(
            text: "Forgot Password?",
            size: 14,
            fontWeight: WeightConst.kLargeWeight,
            color: ColorConst.kTextSecondaryColor,
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: ColorConst.kPrimaryColor),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  
                }
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                child: MyText(
                  text: "SIGN IN",
                  size: 20,
                  fontWeight: WeightConst.kMediumWeight,
                  color: ColorConst.kWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _changeIcon(txt) {
    myIcon = Icons.do_not_disturb;
    color = Colors.red;
    for (var item in UserInfo.users) {
      for (var i in item.keys) {
        if (i == txt) {
          myIcon = Icons.done;
          color = Colors.green;
          myIconBool = true;
        }
      }
    }
  }
}
