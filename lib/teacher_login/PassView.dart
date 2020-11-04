import 'package:flutter/material.dart';
import 'TextFieldContainer.dart';

class PassView extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PassView({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: 'Enter password',
          suffixIcon: Icon(Icons.visibility),
        ),
      ),
    );
  }
}
