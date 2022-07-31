import 'package:flutter/material.dart';

class MyKitchenPage extends StatefulWidget {
  const MyKitchenPage({Key key}) : super(key: key);

  @override
  _MyKitchenPageState createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: const [

          ]
        )
      ),

    );
  }
}