import 'package:culineira/database/model/list.dart';
import 'package:culineira/database/model/recipe.dart';
import 'package:culineira/database/model/shelf.dart';
import 'package:culineira/kitchen/list.dart';
import 'package:culineira/kitchen/shelf.dart';
import 'package:culineira/main.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MyKitchenPage extends StatefulWidget {
  const MyKitchenPage({Key key}) : super(key: key);

  @override
  _MyKitchenPageState createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  //Model.
  List<shelfModel> _shelfList = <shelfModel>[];
  List<listModel> _listRecipeList = <listModel>[];
  List<recipeModel> _recipeInList = <recipeModel>[];

  //Text field contoller.
  final _listNameCtrl = TextEditingController();
  final _listDescriptionCtrl = TextEditingController();

  //Controller.
  Future getShelf() async {
    var connection = await setDatabase();
    _shelfList = <shelfModel>[];

    List<Map<String, Map<String, dynamic>>> results =
        await connection.mappedResultsQuery("SELECT * FROM public.shelf "
            "WHERE users_id = ${passIdUser} "
            "ORDER BY updated_at desc ");

    results.forEach((results) {
      setState(() {
        var shelfModels = shelfModel();

        shelfModels.id = results['shelf']['id'];
        shelfModels.item_name = results['shelf']['item_name'];
        shelfModels.item_description = results['shelf']['item_description'];
        shelfModels.item_qty = results['shelf']['item_qty'];
        shelfModels.created_at = results['shelf']['created_at'];

        _shelfList.add(shelfModels);
      });
    });
  }

  Future getListRecipe() async {
    var connection = await setDatabase();
    _listRecipeList = <listModel>[];

    List<Map<String, Map<String, dynamic>>> results =
        await connection.mappedResultsQuery("SELECT * FROM public.list "
            "WHERE user_id = ${passIdUser} "
            "ORDER BY updated_at desc");

    results.forEach((results) {
      setState(() {
        var listModels = listModel();

        listModels.id = results['list']['id'];
        listModels.list_name = results['list']['list_name'];
        listModels.list_status = results['list']['list_status'];
        listModels.list_description = results['list']['list_description'];
        listModels.updated_at = results['list']['updated_at'];

        _listRecipeList.add(listModels);
      });
    });
  }

  Future getRecipeInList() async {
    var connection = await setDatabase();
    _recipeInList = <recipeModel>[];

    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
        "SELECT list_rel.id, list.id, recipes.recipe_name, recipes.recipe_type, list_rel.created_at FROM public.recipes "
        "JOIN public.list_rel on public.recipes.id = public.list_rel.recipe_id "
        "JOIN public.list on public.list.id = public.list_rel.list_id "
        "WHERE list.user_id = ${passIdUser} "
        "ORDER BY list_rel.created_at desc");

    results.forEach((results) {
      setState(() {
        var recipeModels = recipeModel();

        recipeModels.id = results['list_rel']['id'];
        recipeModels.list_id = results['list']['id'];
        recipeModels.recipe_name = results['recipes']['recipe_name'];
        recipeModels.recipe_type = results['recipes']['recipe_type'];
        recipeModels.created_at = results['list_rel']['created_at'];

        _recipeInList.add(recipeModels);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getShelf();
    getListRecipe();
    getRecipeInList();
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(padding: const EdgeInsets.all(0), children: [
            Container(
              margin:
                  EdgeInsets.only(top: fullHeight * 0.08, left: 20, right: 20),
              child: Row(children: [
                const Text("Recipe List",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: TextButton.icon(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          contentPadding: EdgeInsets.all(15),
                          content: SizedBox(
                            height: 300,
                            width: fullWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Ink(
                                    child: IconButton(
                                      icon: const Icon(Icons.close, size: 36),
                                      color: dangerColor,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  child: Text("Add List",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text("Name",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 40,
                                  child: TextField(
                                    controller: _listNameCtrl,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          top: 5, left: 10, right: 10),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 205, 205),
                                            width: 2.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Text("Description",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 80,
                                  child: TextField(
                                    controller: _listDescriptionCtrl,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          top: 5, left: 10, right: 10),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 205, 205),
                                            width: 2.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  //Create List
                                  var connection = await setDatabase();
                                  var date = DateFormat("yyyy-MM-dd h:m:s")
                                      .format(DateTime.now())
                                      .toString();

                                  await connection.execute(
                                      "INSERT INTO public.list( "
                                      "user_id, list_name, list_status, list_description, created_at, updated_at) "
                                      "VALUES (${passIdUser}, '${_listNameCtrl.text}', 'null', '${_listDescriptionCtrl.text}', '${date}', '${date}');");

                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.add, size: 18),
                                label: Text("Create List"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green, // Background color
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      icon: Icon(Icons.add, size: 22, color: primaryColor),
                      label: Text("Create",
                          style: TextStyle(fontSize: 16, color: primaryColor)),
                    )),
                Ink(
                  child: IconButton(
                    icon: const Icon(Icons.delete, size: 26),
                    color: dangerColor,
                    onPressed: () {},
                  ),
                ),
                Ink(
                  child: IconButton(
                    icon: const Icon(Icons.repeat, size: 26),
                    color: const Color(0xFF77568d),
                    onPressed: () {},
                  ),
                ),
              ]),
            ),
            SizedBox(
                height: 340,
                width: fullWidth,
                child: ListRecipe(data: _listRecipeList, data2: _recipeInList)),
            Container(
              width: fullWidth,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Recipe Calendar",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  TableCalendar(
                      focusedDay: selectedDay,
                      firstDay: DateTime(2020),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        });
                        print(focusedDay);
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: const Color(0xFF4183D7),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        todayDecoration: BoxDecoration(
                          color: const Color(0xFF62C2F5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        weekendDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        selectedTextStyle: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            Container(
                width: fullWidth,
                padding: const EdgeInsets.all(10),
                height: fullHeight * 0.5,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.white,
                child: Shelf(data: _shelfList)),
            Container(
              width: fullWidth,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Classroom",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
