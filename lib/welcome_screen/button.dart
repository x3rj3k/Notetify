import 'package:flutter/material.dart';
import 'package:mobile_project/constant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton(
      {Key key,
      this.text,
      this.press,
      this.color = KPrimaryColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          onPressed: press,
          child: Text(text,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 20)),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: Colors.pink,
        ),
      ),
    );
  }
}
