import 'package:flutter/material.dart';
import 'package:mobile_project/teacher_reg/reg_screen.dart';
import 'package:mobile_project/welcome_screen/button.dart';
import 'UserInputField.dart';
import 'background.dart';
import 'PassView.dart';
import 'TeacherCheckAccount.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Teacher Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.03),
        Image.asset(
          'assets/images/teacher.png',
          height: size.height * 0.30,
        ),
        UserInputField(
          hintText: "Enter teacher ID",
          onChanged: (value) {},
        ),
        PassView(
          onChanged: (value) {},
        ),
        RoundedButton(
          text: 'Login',
          press: () {},
        ),
        TeacherCheckAccount(
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TeacherReg();
                },
              ),
            );
          },
        ),
      ],
    ));
  }
}
