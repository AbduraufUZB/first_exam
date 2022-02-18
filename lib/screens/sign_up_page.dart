import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/data/user_info.dart';
import 'package:first_exam/widgets/myappbar_widget.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:first_exam/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool myIconBool = false;
  IconData myIcon = Icons.do_not_disturb;
  Color color = Colors.red;

  bool obscureText = true;
  IconData myPassIcon = Icons.visibility;

  bool newBool = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.myAppBar(text: "Forgot Password"),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingMarginConst.kMediumPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
                text: "Create Account",
                size: FontConst.kExtraLargeFont + 10,
                fontWeight: WeightConst.kMediumWeight),
            MyText(
              text: "Enter your Name, Email and Password",
              size: FontConst.kMediumFont,
              color: ColorConst.kTextSecondaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "for sign up.  ",
                  size: FontConst.kMediumFont,
                  color: ColorConst.kTextSecondaryColor,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: MyText(
                    text: "Already have account?",
                    size: FontConst.kMediumFont,
                    color: ColorConst.kPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            TextFormField(
              onChanged: (txt) {
                if (txt.isNotEmpty) {
                  myIcon = Icons.done;
                  color = Colors.green;
                } else {
                  myIcon = Icons.do_not_disturb;
                  color = Colors.red;
                }
                setState(() {});
              },
              controller: _fullNameController,
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
                      text: "FULL NAME",
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
            TextFormField(
              onChanged: (txt) {
                if (txt.isNotEmpty) {
                  myIcon = Icons.done;
                  color = Colors.green;
                  for (var item in UserInfo.users) {
                    for (var i in item.keys) {
                      if (i == txt) {
                        myIcon = Icons.do_not_disturb;
                        color = Colors.red;
                        MyMessenger.showMyMessenger(
                            "This account is already registread!", context);
                      }
                    }
                  }
                }
                setState(() {});
              },
              controller: _emailController,
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
              child: Form(
                key: _formKey,
                child: TextFormField(
                  
                  obscureText: obscureText,
                  controller: _passwordController,
                  validator: (txt) {
                    if (txt!.length < 8) {
                      return "The number of characters must be more than 8!";
                    }
                  },
                  cursorColor: ColorConst.kTextSecondaryColor,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: () {
                        if (myPassIcon == Icons.visibility) {
                          obscureText = true;
                          myPassIcon = Icons.visibility_off;
                        } else {
                          obscureText = false;
                          myPassIcon = Icons.visibility;
                        }
                        setState(() {});
                      },
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
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: ColorConst.kPrimaryColor),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_emailController.text.isNotEmpty) {
                      for (var item in UserInfo.users) {
                        for (var i in item.keys) {
                          if (i == _emailController.text) {
                            newBool = true;
                            MyMessenger.showMyMessenger(
                                "This account is already registread!", context);
                          }
                        }
                      }
                      if (!newBool) {
                        UserInfo.users.add({_emailController.text: _passwordController.text});
                        Navigator.pushReplacementNamed(context, "/homepage");
                      }
                    }
                  }
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
      ),
    );
  }
}
