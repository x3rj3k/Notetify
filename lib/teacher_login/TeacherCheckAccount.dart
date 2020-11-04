import 'package:flutter/material.dart';
import 'package:mobile_project/constant.dart';

class TeacherCheckAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const TeacherCheckAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have any account?" : "Already have an account",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign up here" : "Sign In",
            style: TextStyle(fontWeight: FontWeight.bold, color: KPrimaryColor),
          ),
        ),
      ],
    );
  }
}
