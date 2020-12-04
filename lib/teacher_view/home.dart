import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfile createState() => _TeacherProfile();
}

class _TeacherProfile extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello Brenda!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Today you have 9 tasks',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Image.asset('assets/images/asd.jpg'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFFA7397),
          child: Icon(
            Icons.add,
            color: Color(0xFFFDDE42),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
