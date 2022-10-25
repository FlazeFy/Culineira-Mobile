import 'package:culineira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool dark = false;
  bool remember = false;
  bool notif = false;

  @override
  Widget build(BuildContext context) {
    // double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 128, 128, 128).withOpacity(0.25),
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: const Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Column(children: [
          Container(
            width: fullWidth,
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 30),
                child: const Icon(Icons.lightbulb,
                    size: 24, color: Color(0xFF414141)),
              ),
              const Text('Dark Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF414141))),
              const Spacer(),
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
            ]),
          ),
          Container(
            width: fullWidth,
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 30),
                child:
                    const Icon(Icons.key, size: 24, color: Color(0xFF414141)),
              ),
              const Text('Remember Me',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF414141))),
              const Spacer(),
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
            ]),
          ),
          Container(
            width: fullWidth,
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 30),
                child: const Icon(Icons.notifications_on,
                    size: 24, color: Color(0xFF414141)),
              ),
              const Text('Notification',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF414141))),
              const Spacer(),
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
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const ListTile(
                leading: Icon(Icons.language, size: 26),
                title: Text('Language',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF414141))),
                trailing: Icon(Icons.arrow_forward_ios, size: 20)),
          ),
        ]));
  }
}
