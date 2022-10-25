import 'package:flutter/material.dart';

class Apps extends StatefulWidget {
  const Apps({Key key}) : super(key: key);

  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    // double fullHeight =  MediaQuery.of(context).size.height;
    // double fullWidth =  MediaQuery.of(context).size.width;

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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const ListTile(
                  leading: Icon(Icons.book, size: 26),
                  title: Text('Recipes',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF414141))),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const ListTile(
                  leading: Icon(Icons.book, size: 26),
                  title: Text('Classroom',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF414141))),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const ListTile(
                  leading: Icon(Icons.group, size: 26),
                  title: Text('Community',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF414141))),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const ListTile(
                  leading: Icon(Icons.star, size: 26),
                  title: Text('Achievement',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF414141))),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const ListTile(
                  leading: Icon(Icons.bookmark, size: 26),
                  title: Text('Collection',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF414141))),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const ListTile(
                  leading: Icon(Icons.history, size: 26),
                  title: Text('Activity',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF414141))),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20)),
            ),
          ],
        ));
  }
}
