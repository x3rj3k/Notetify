import 'package:flutter/material.dart';
import 'body.dart';
import 'constant.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
