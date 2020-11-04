import 'package:flutter/material.dart';
import 'package:mobile_project/student_login/login.dart';
import 'package:mobile_project/teacher_login/teacherLogin.dart';
import 'button.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "NOTETIFY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Image.asset(
              'assets/images/chat.png',
              height: size.height * 0.45,
            ),
            RoundedButton(
              text: "Student",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return StudengLogin();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Teacher",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TeacherLogin();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
