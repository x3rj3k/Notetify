import 'package:flutter/material.dart';
import 'package:mobile_project/welcome_screen/button.dart';
import 'package:mobile_project/welcome_screen/welc_screen.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> data = [
    {"text": "Welcome to Notetify!", "image": "assets/images/chat.png"},
    {
      "text": "Easy access by the student",
      "image": "assets/images/student.png"
    },
    {
      "text": "Teacher can easily notify the student",
      "image": "assets/images/teacher.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => SplashContent(
                  image: data[index]['image'],
                  text: data[index]['text'],
                ),
              ),
            ),
            Spacer(),
            RoundedButton(
              text: 'Get Started',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
