import 'package:flutter/material.dart';
import 'package:mobile_project/teacher_login/PassView.dart';
import 'package:mobile_project/teacher_login/UserInputField.dart';
import 'package:mobile_project/welcome_screen/button.dart';
import 'background.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SIGN UP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          UserInputField(
            hintText: "Your ID",
          ),
          PassView(),
          RoundedButton(
            text: 'Sign up',
            press: () {},
          ),
        ],
      ),
    );
  }
}
