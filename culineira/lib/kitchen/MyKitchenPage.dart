import 'package:culineira/main.dart';
import 'package:culineira/others/checkbox.dart';
import 'package:flutter/material.dart';

class MyKitchenPage extends StatefulWidget {
  const MyKitchenPage({Key key}) : super(key: key);

  @override
  _MyKitchenPageState createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: fullHeight*0.08, left: 20, right: 20),
              child: Row(
                children:[
                  const Text("Recipe List", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: TextButton.icon(
                      onPressed: () {
                          // Respond to button press
                      },
                      icon: Icon(Icons.add, size: 22, color: primaryColor),
                      label: Text("Create", style: TextStyle(fontSize: 16, color: primaryColor)),
                    )
                  ),
                  Ink(
                    child: IconButton(
                      icon: const Icon(Icons.delete, size: 26),
                      color: Color.fromARGB(255, 199, 65, 80),
                      onPressed: () {},
                    ),
                  ),
                  Ink(
                    child: IconButton(
                      icon: const Icon(Icons.repeat, size: 26),
                      color: Color(0xFF77568d),
                      onPressed: () {},
                    ),
                  ),
                ]
              ),
            ),
            Container(
              height: 340,
              width: fullWidth,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  GestureDetector(
                    child: Container(
                      width: 260,
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Ink(
                                child: IconButton(
                                  icon: const Icon(Icons.star_border_outlined, size: 22),
                                  onPressed: () {},
                                ),
                              ),
                              Spacer(),
                              Text("Chicken Legacy", style: TextStyle(fontWeight: FontWeight.w500)),
                              Spacer(),
                              CheckRecipeList()
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("6", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF414141))),
                                    const Text("Recipe", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Jun-18 01:07", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF414141))),
                                    const Text("Updated At", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 
                              overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 12, color: Colors.grey)
                            ),
                          ),
                          Container(
                            height: 135,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: ListView(
                              padding: EdgeInsets.only(top: 0),
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Text("Chicken Kebab", style: TextStyle(color: Color(0xFF414141))),
                                      Spacer(),
                                      Text("Appetizer", style: TextStyle(color: Color(0xFF414141)))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                      // Respond to button press
                                  },
                                  icon: Icon(Icons.add, size: 18),
                                  label: Text("Add Recipe"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green, // Background color
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton.icon(
                                  onPressed: () {
                                      // Respond to button press
                                  },
                                  icon: Icon(Icons.arrow_forward, size: 18),
                                  label: Text("Browse"),
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor, // Background color
                                  ),
                                )
                              ],
                            )
                          )
                        ]
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  )
                ]
              ),
            )
            
          ]
        )
      ),

    );
  }
}