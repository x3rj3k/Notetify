import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          'NOTETIFY',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Image.asset(
          image,
          height: size.height * 0.35,
        ),
      ],
    );
  }
}
