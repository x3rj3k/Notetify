import 'package:flutter/material.dart';
import 'package:mobile_project/constant.dart';

class HeaderContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  HeaderContainer({this.height, this.width, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding != null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: LightColors.kDarkYellow,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100.0),
            bottomLeft: Radius.circular(100.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
