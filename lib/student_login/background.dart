import 'package:flutter/material.dart';
import 'package:mobile_project/welcome_screen/BackHome.dart';
import 'package:mobile_project/welcome_screen/welc_screen.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 70,
            left: 50,
            child: BackHome(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          ),
          child,
        ],
      ),
    );
  }
}
