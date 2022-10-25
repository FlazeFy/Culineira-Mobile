import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_spinbox/material.dart';

class CreateInstantRecipePage extends StatefulWidget {
  const CreateInstantRecipePage({Key key}) : super(key: key);

  @override
  _CreateInstantRecipePageState createState() =>
      _CreateInstantRecipePageState();
}

class _CreateInstantRecipePageState extends State<CreateInstantRecipePage> {
  //Initial variable
  String selectedRType;
  String selectedRLevel;
  String selectedRVisibility;

  List<String> itemRType = ['Main Course', 'Appetizer', 'Desserts'];
  List<String> itemRLevel = ['Beginner', 'Intermediate', 'Expert'];
  List<String> itemRVisibility = ['Public', 'Private', 'Restricted'];

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SizedBox(
      height: fullHeight,
      child: ListView(
          padding:
              EdgeInsets.symmetric(vertical: fullHeight * 0.08, horizontal: 10),
          children: [
            const Text("Add New Recipe",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 128, 128, 128)
                        .withOpacity(0.25),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                  )
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: const Text("Recipe Type",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: Text(
                                      'Main Course',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: itemRType
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedRType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRType = value as String;
                                      });
                                    },
                                    buttonPadding: const EdgeInsets.all(5),
                                    buttonDecoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                    buttonHeight: 50,
                                    buttonWidth: 140,
                                    itemHeight: 40,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: const Text("Recipe Country",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                                const SizedBox(
                                  width: 160,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 3, left: 10, right: 10),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 205, 205),
                                            width: 2.0),
                                      ),
                                      hintText: "ex : Indonesia",
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Recipe Name",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500))),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 3, left: 10, right: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 205, 205),
                                width: 2.0),
                          ),
                          hintText: "ex : Pizza",
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Description",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500))),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 3, left: 10, right: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 205, 205),
                                width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Main Ingredients",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500))),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 3, left: 10, right: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 205, 205, 205),
                                  width: 2.0),
                            ),
                            hintText: "Beef, Tomato, ..."),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Time Spend / Calorie",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500))),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140,
                            height: 50,
                            child: SpinBox(
                              min: 1, max: 480,
                              value: 1,
                              spacing: 1,
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                              ),
                              // onChanged: (value) =>
                              decoration:
                                  const InputDecoration(labelText: 'Minutes'),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: SpinBox(
                              min: 1, max: 1200,
                              value: 1,
                              spacing: 1,
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                              ),
                              // onChanged: (value) =>
                              decoration:
                                  const InputDecoration(labelText: 'Calorie'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: const Text("Level",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: Text(
                                      'Beginner',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: itemRLevel
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedRLevel,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRLevel = value as String;
                                      });
                                    },
                                    buttonPadding: const EdgeInsets.all(5),
                                    buttonDecoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                    buttonHeight: 50,
                                    buttonWidth: 140,
                                    itemHeight: 40,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: const Text("Visibility",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: Text(
                                      'Public',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: itemRVisibility
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedRVisibility,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRVisibility = value as String;
                                      });
                                    },
                                    buttonPadding: const EdgeInsets.all(5),
                                    buttonDecoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                    buttonHeight: 50,
                                    buttonWidth: 160,
                                    itemHeight: 40,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () async {},
                        icon: const Icon(Icons.add, size: 20),
                        label: const Text("Post"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                        ),
                      ),
                    )
                  ]),
            )
          ]),
    ));
  }
}
