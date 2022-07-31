import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
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
                  const Text("Global", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: TextButton.icon(
                      onPressed: () {
                          // Respond to button press
                      },
                      icon: Icon(Icons.arrow_forward_outlined, size: 22, color: primaryColor),
                      label: Text("My Recipes", style: TextStyle(fontSize: 16, color: primaryColor)),
                    )
                  ),
                  Ink(
                    child: IconButton(
                      icon: const Icon(Icons.notifications_on_outlined, size: 26),
                      color: iconMainColor,
                      onPressed: () {},
                    ),
                  ),
                ]
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Filtered by: ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                  Text("All", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14))
                ],
              )
            ),
            SizedBox(
              width: fullWidth,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 10),
                    padding: const EdgeInsets.all(3),
                    width: fullWidth*0.75,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "recipe or main ingredients",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    )
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 10),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.sort, size: 26),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 145,
                margin: const EdgeInsets.only(left: 10, top: 15),
                padding: const EdgeInsets.only(top: 10, left: 10),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text("New Recipes this week", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(top: 10),
                        children: [
                          GestureDetector(
                            onTap: (){
                              //
                            },
                            child: Column(
                              children:[
                                Container(
                                  height: 70,
                                  width: 70,
                                  margin: const EdgeInsets.only(bottom:5, left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: primaryColor,
                                      width: 3,
                                    ),
                                    color: primaryColor,
                                  ),
                                  child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(18),
                                      child: Image.asset('assets/image/icon/CreateNewRecipe.png', fit: BoxFit.cover),
                                    ),
                                  )
                                ),
                                const Text("New Recipe", style: TextStyle(fontSize: 12))
                              ]
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              //
                            },
                            child: Column(
                              children:[
                                Container(
                                  height: 75,
                                  width: 75,
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(18),
                                      child: Image.asset('assets/image/recipes/Mie Kuah Udang_1.png', fit: BoxFit.cover),
                                    ),
                                  )
                                ),
                                const Text("Mie Kuah Udang", style: TextStyle(fontSize: 12))
                              ]
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                )
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              color: const Color(0xFFFFc3bC),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.all(10),
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "You have unfinished recipe ",
                        style: TextStyle(fontSize: 18, color: Colors.black)
                      ),
                      WidgetSpan(
                        child: const Icon(Icons.warning_rounded, size: 20, color: Colors.black),
                      ),
                    ]
                  )
                ),
                subtitle: const Text('Your unfinished recipe will be automaticly delete after a week since it was created', style: TextStyle(fontSize: 12.5, color: Color(0xFF414141))),
                children: <Widget>[
                  Container(
                    height: 115,
                    margin: const EdgeInsets.only(left: 10),
                    child: Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: (){
                              //
                            },
                            child: Column(
                              children:[
                                Container(
                                  height: 80,
                                  width: 80,
                                  margin: const EdgeInsets.only(bottom:5, left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(18),
                                      child: Image.asset('assets/image/recipes/Buncis Tumis Tempe_1.png', fit: BoxFit.cover),
                                    ),
                                  )
                                ),
                                const Text("Buncis Tumis", style: TextStyle(fontSize: 12))
                              ]
                            ),
                          ),
                        ],
                      )
                    )
                  )
                ],
              ),
            ),
            Container(
              height: fullHeight,
              width: fullWidth,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DefaultTabController(
                initialIndex: 1,
                length: 6,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0,
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      labelColor: primaryColor,
                      indicatorColor: primaryColor,
                      unselectedLabelColor: iconMainColor,
                      isScrollable: true,
                      tabs: <Widget>[
                        Tab(
                          text: "Main Course",
                        ),
                        Tab(
                          text: "Appetizer",
                        ),
                        Tab(
                          text: "Desserts",
                        ),
                        Tab(
                          text: "You May Also Like",
                        ),
                        Tab(
                          text: "Recipe In My List",
                        ),
                        Tab(
                          text: "Best Recipe",
                        )
                      ],
                    ),
                  ),
                  body: const TabBarView(
                    children: <Widget>[
                      Center(
                        child: Text("It's cloudy here"),
                      ),
                      Center(
                        child: Text("It's rainy here"),
                      ),
                      Center(
                        child: Text("It's sunny here"),
                      ),
                      Center(
                        child: Text("It's cloudy here"),
                      ),
                      Center(
                        child: Text("It's rainy here"),
                      ),
                      Center(
                        child: Text("It's sunny here"),
                      ),
                    ],
                  ),
                ),
              )
            
            )
          ]
        )
      ),

    );
  }
}