import 'package:flutter/material.dart';

class SubjectContainer extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;
  final Function press;

  SubjectContainer({
    this.cardColor,
    this.title,
    this.subtitle,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.all(15.0),
          height: 200,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$subtitle',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
