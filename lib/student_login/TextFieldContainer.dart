import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(25)),
      child: child,
    );
  }
}
