import 'dart:ffi';
import 'package:culineira/main.dart';
import 'package:intl/intl.dart';
import 'package:culineira/services/connect.dart';
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
  String selectedRType = "Main Course";
  String selectedRLevel = "Beginner";
  String selectedRVisibility = "Public";
  int _recipeTime = 15;
  int _recipeCal = 75;

  //Text field contoller.
  final _recipeNameCtrl = TextEditingController();
  final _recipeCountryCtrl = TextEditingController();
  final _recipeDescCtrl = TextEditingController();
  final _recipeMainIngCtrl = TextEditingController();

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
                                SizedBox(
                                  width: 160,
                                  child: TextField(
                                    controller: _recipeCountryCtrl,
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
                      child: TextField(
                        controller: _recipeNameCtrl,
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
                      child: TextField(
                        controller: _recipeDescCtrl,
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
                      child: TextField(
                        controller: _recipeMainIngCtrl,
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
                              min: 1,
                              max: 480,
                              value: 1,
                              spacing: 1,
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                              ),
                              onChanged: (value) => _recipeTime = value.toInt(),
                              decoration:
                                  const InputDecoration(labelText: 'Minutes'),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: SpinBox(
                              min: 1,
                              max: 1200,
                              value: 1,
                              spacing: 1,
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                              ),
                              onChanged: (value) => _recipeCal = value.toInt(),
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
                        onPressed: () async {
                          //Insert recipe
                          var connection = await setDatabase();
                          var date = DateFormat("yyyy-MM-dd h:m:s")
                              .format(DateTime.now())
                              .toString();

                          //Validate empty
                          if ((_recipeNameCtrl.text.isNotEmpty) &&
                              (_recipeDescCtrl.text.isNotEmpty) &&
                              (_recipeMainIngCtrl.text.isNotEmpty) &&
                              (_recipeCountryCtrl.text.isNotEmpty)) {
                            await connection.execute(
                                "INSERT INTO public.recipes( "
                                "user_id, recipe_name, recipe_calorie, recipe_desc, recipe_country, recipe_type, recipe_time_spend, recipe_main_ing, recipe_level, created_at, updated_at, recipe_visibility, recipe_url, recipe_video) "
                                "VALUES (${passIdUser}, '${_recipeNameCtrl.text}', ${_recipeCal}, '${_recipeDescCtrl.text}', '${_recipeCountryCtrl.text}', '${selectedRType}', ${_recipeTime}, '${_recipeMainIngCtrl.text}', '${selectedRLevel}', '${date}', '${date}', '${selectedRVisibility}', 'null', 'null');");

                            Navigator.pop(context);
                          } else {
                            //Do something...
                          }
                        },
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
