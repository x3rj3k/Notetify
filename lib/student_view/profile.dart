import 'package:flutter/material.dart';
import 'package:mobile_project/welcome_screen/welc_screen.dart';
import 'home.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  int index = 0;
  List<Widget> list = [
    StudentProfile(),
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ikaw na bahala'),
        ),
        body: list[index],
        drawer: MyDrawer(onTap: (ctx, i) {
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
        }),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Container(
                  //   width: 60,
                  //   height: 60,
                  //   child: CircleAvatar(
                  //     backgroundImage: AssetImage('assets/images/asd.jpg'),
                  //   ),
                  // ),
                  // SizedBox(height: 15),
                  Text('Criven Niño Butatil',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  SizedBox(height: 3),
                  Text('Gwapo nga Bata',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ))
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => onTap(context, 0),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => onTap(context, 1),
          ),
          Divider(
            thickness: 3,
            indent: 5,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => onTap(context, 2),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => WelcomeScreen(),
          ),
        ],
      )),
    );
  }
}
