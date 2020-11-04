import 'package:flutter/material.dart';
import 'package:mobile_project/student_register/register_screen.dart';
import 'package:mobile_project/welcome_screen/BackHome.dart';
import 'package:mobile_project/welcome_screen/button.dart';
import 'package:mobile_project/welcome_screen/welc_screen.dart';
import 'background.dart';
import 'UserInputField.dart';
import 'PassView.dart';
import 'CheckAccount.dart';

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
          "Student Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.03),
        Image.asset(
          'assets/images/student.png',
          height: size.height * 0.30,
        ),
        UserInputField(
          hintText: "Enter your student ID",
          onChanged: (value) {},
        ),
        PassView(
          onChanged: (value) {},
        ),
        RoundedButton(
          text: 'Login',
          press: () {},
        ),
        CheckAccount(
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return StudentReg();
                },
              ),
            );
          },
        ),
      ],
    ));
  }
}
