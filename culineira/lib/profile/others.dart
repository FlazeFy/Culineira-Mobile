import 'package:flutter/material.dart';

class Others extends StatefulWidget {
  Others({Key key}) : super(key: key);

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 128, 128, 128).withOpacity(0.25),
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 10  horizontally
              5.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const ListTile(
              leading: Icon(Icons.help, size: 26),
              title: Text('Guide', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
              trailing: Icon(Icons.arrow_forward_ios, size: 20)
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const ListTile(
              leading: Icon(Icons.security, size: 26),
              title: Text('Privacy & Conditions', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
              trailing: Icon(Icons.arrow_forward_ios, size: 20)
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const ListTile(
              leading: Icon(Icons.info, size: 26),
              title: Text('About Us', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF414141))),
              trailing: Icon(Icons.arrow_forward_ios, size: 20)
            ),
          ),
        ]
      )
    );
  }
}