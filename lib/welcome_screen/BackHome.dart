import 'package:flutter/material.dart';
import 'package:mobile_project/constant.dart';

class BackHome extends StatelessWidget {
  final Function press;
  final String input;
  const BackHome({
    Key key,
    this.press,
    this.input = '< Back',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Text(
            input,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
      ],
    );
  }
}
