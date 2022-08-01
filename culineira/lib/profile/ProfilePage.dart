import 'package:culineira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool dark = false;
  bool remember = false;
  bool notif = false;

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: fullHeight,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              margin: EdgeInsets.only(top: fullHeight*0.08, left: 20, right: 20),
              child: Row(
                children:[
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                      'assets/image/users/user_rosemonde.jpg', width: 75),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("@flazefy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                        const Text("flazen.edu@gmail.com", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: fullWidth*0.55,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("20", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF414141))),
                                  Text("Following", style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("500", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF414141))),
                                  Text("Followers", style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("500", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF414141))),
                                  Text("Recipes", style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                  const Spacer(),
                  Ink(
                    child: IconButton(
                      icon: const Icon(Icons.edit, size: 26),
                      color: iconMainColor,
                      onPressed: () {},
                    ),
                  ),
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 15),
              child: Text("Apps", style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF414141))),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.book, size: 26),
                title: Text('Recipes', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.book, size: 26),
                title: Text('Classroom', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.group, size: 26),
                title: Text('Community', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.star, size: 26),
                title: Text('Achievement', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.bookmark, size: 26),
                title: Text('Collection', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.history, size: 26),
                title: Text('Activity', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 15),
              child: Text("Setting", style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Container(
              width: fullWidth,
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 30),
                    child: Icon(Icons.lightbulb, size: 24, color: Color(0xFF414141)),
                  ),
                  Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                  Spacer(),
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    value: dark,
                    activeColor: primaryColor,
                    onToggle: (val) {
                      setState(() {
                        dark = val;
                      });
                    },
                  ),
                ]
              ),
            ),
            Container(
              width: fullWidth,
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 30),
                    child: Icon(Icons.key, size: 24, color: Color(0xFF414141)),
                  ),
                  Text('Remember Me', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                  Spacer(),
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    value: remember,
                    activeColor: primaryColor,
                    onToggle: (val) {
                      setState(() {
                        remember = val;
                      });
                    },
                  ),
                ]
              ),
            ),
            Container(
              width: fullWidth,
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 30),
                    child: Icon(Icons.notifications_on, size: 24, color: Color(0xFF414141)),
                  ),
                  Text('Notification', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                  Spacer(),
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    value: notif,
                    activeColor: primaryColor,
                    onToggle: (val) {
                      setState(() {
                        notif = val;
                      });
                    },
                  ),
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.language, size: 26),
                title: Text('Language', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 15),
              child: Text("Others", style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.help, size: 26),
                title: Text('Guide', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.security, size: 26),
                title: Text('Privacy & Conditions', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: ListTile(
                leading: Icon(Icons.info, size: 26),
                title: Text('About Us', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)
              ),
            ),
          ]
        )
      ),

    );
  }
}