import 'package:culineira/database/model/shelf.dart';
import 'package:culineira/kitchen/shelf.dart';
import 'package:culineira/main.dart';
import 'package:culineira/others/checkbox.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

  //Controller.
  Future getShelf() async {
    var connection =  await setDatabase();
    _shelfList = <shelfModel>[];
    
    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    "SELECT * FROM public.shelf "
    "WHERE users_id = ${passIdUser} "
    "ORDER BY created_at desc ");

    results.forEach((results){
      setState((){
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

  @override
  void initState() {
    super.initState();
    getShelf();
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: const EdgeInsets.all(0),
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
                ]
              ),
            ),
            SizedBox(
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
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
                              const Spacer(),
                              const Text("Chicken Legacy", style: TextStyle(fontWeight: FontWeight.w500)),
                              const Spacer(),
                              const CheckRecipeList()
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
                                  children: const [
                                    Text("6", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF414141))),
                                    Text("Recipe", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text("Jun-18 01:07", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF414141))),
                                    Text("Updated At", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 
                              overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 12, color: Colors.grey)
                            ),
                          ),
                          Container(
                            height: 135,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListView(
                              padding: const EdgeInsets.only(top: 0),
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Row(
                                    children: const [
                                      Text("Chicken Kebab", style: TextStyle(color: Color(0xFF414141))),
                                      Spacer(),
                                      Text("Appetizer", style: TextStyle(color: Color(0xFF414141)))
                                    ],
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                      // Respond to button press
                                  },
                                  icon: const Icon(Icons.add, size: 18),
                                  label: const Text("Add Recipe"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green, // Background color
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton.icon(
                                  onPressed: () {
                                      // Respond to button press
                                  },
                                  icon: const Icon(Icons.arrow_forward, size: 18),
                                  label: const Text("Browse"),
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor, // Background color
                                  ),
                                )
                              ],
                            )
                          )
                        ]
                      ),
                    ),
                  ),
                ]
              ),
            ), 
            Container(
              width: fullWidth,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Recipe Calendar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    )
                  ),
                ],
              ),
            ),
            Container(
              width: fullWidth,
              padding: const EdgeInsets.all(10),
              height: fullHeight*0.5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Shelf(data: _shelfList)
            ),
            Container(
              width: fullWidth,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Classroom", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  
                ],
              ),
            )
            
          ]
        )
      ),

    );
  }
}