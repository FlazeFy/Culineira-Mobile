import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    return Scaffold(
       appBar: AppBar(
        title: Row(
          
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.reply),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.copy), //Should be paperclip icon for save to cook list button
            onPressed: () {
              //
            },
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              
            },
          ),
        ],
        backgroundColor: primaryColor,
      ),
      body: SizedBox(
        height: fullHeight,
        child: ListView(
          children: [
            DefaultTabController(
              initialIndex: 0,
              length: 4,
              child: Expanded(
                child: Column(
                  children:[
                    TabBar (
                      labelColor: primaryColor,
                      indicatorColor: primaryColor,
                      unselectedLabelColor: iconMainColor,
                      isScrollable: true,
                      tabs: const <Widget>[
                        Tab(
                          text: "Main",
                        ),
                        Tab(
                          text: "Ingredients",
                        ),
                        Tab(
                          text: "How To Make",
                        ),
                        Tab(
                          text: "Others",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: fullHeight*0.85,
                      child: TabBarView(
                        children: <Widget>[
                          ListView(
                            padding: const EdgeInsets.only(top: 20),
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                'assets/image/recipes/Buncis Tumis Tempe_1.png', scale: 1.3),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Buncis Tumis Tempe", style: TextStyle(color: iconMainColor, fontSize: 22, fontWeight: FontWeight.bold)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Colors.green.withOpacity(0.2)
                                          ),
                                          child: Text("Beginner", style: TextStyle(color: secondaryColor)),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const WidgetSpan(
                                                child: Icon(Icons.punch_clock, size: 16),
                                              ),
                                              TextSpan(
                                                text: " 20 min",
                                                style: TextStyle(color: iconMainColor, fontWeight: FontWeight.w500)
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {
                                              // Respond to button press
                                          },
                                          icon: Icon(Icons.favorite, size: 18, color: dangerColor),
                                          label: Text("2", style: TextStyle(color: dangerColor)),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                      alignment: Alignment.center,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 5),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Type : ",
                                                    style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                  TextSpan(
                                                    text: "Appetizer",
                                                    style: TextStyle(color: iconMainColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 5),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Country : ",
                                                    style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                  TextSpan(
                                                    text: "Indonesia",
                                                    style: TextStyle(color: iconMainColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 5),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Calorie : ",
                                                    style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                  TextSpan(
                                                    text: "250 cal",
                                                    style: TextStyle(color: iconMainColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 5),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Main Ingredients : ",
                                                    style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                  TextSpan(
                                                    text: "Beans, Tempeh ",
                                                    style: TextStyle(color: iconMainColor, fontWeight: FontWeight.w500, fontSize: 16)
                                                  ),
                                                  const WidgetSpan(
                                                    child: Icon(Icons.info, size: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 50),
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: <Widget>[
                                          const Expanded(
                                            child: Divider(thickness: 1.5)
                                          ),       
                                          Text("  Description  ", style: TextStyle(color: iconMainColor, fontWeight: FontWeight.bold, fontSize: 18)),
                                          const Expanded(
                                            child: Divider(thickness: 1.5)
                                          ), 
                                        ]
                                      )
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      alignment: Alignment.bottomRight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 5),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Created On : ",
                                                    style: TextStyle(color: iconMainColor, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)
                                                  ),
                                                  TextSpan(
                                                    text: "2022-06-02 14:55:00",
                                                    style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500, fontSize: 13, fontStyle: FontStyle.italic)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 5),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Updated On : ",
                                                    style: TextStyle(color: iconMainColor, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)
                                                  ),
                                                  TextSpan(
                                                    text: "2022-07-07 03:07:45",
                                                    style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500, fontSize: 13, fontStyle: FontStyle.italic)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: <Widget>[
                                          const Expanded(
                                            child: Divider(thickness: 1.5)
                                          ),       
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "  Contributors ",
                                                  style: TextStyle(color: iconMainColor, fontWeight: FontWeight.bold, fontSize: 18)
                                                ),
                                                const WidgetSpan(
                                                  child: Icon(Icons.info, size: 16),
                                                ),
                                                const TextSpan(
                                                  text: "  ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Expanded(
                                            child: Divider(thickness: 1.5)
                                          ), 
                                        ]
                                      )
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 50, top: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(60),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.45),
                                                  blurRadius: 10.0,
                                                  spreadRadius: 0.0, 
                                                  offset: const Offset(5.0, 5.0,),
                                                )
                                              ],
                                            ),
                                            margin: const EdgeInsets.only(bottom: 5),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(60),
                                              child: Image.asset(
                                              'assets/image/users/user_rosemonde.jpg', width: 45),
                                            ),
                                          ),
                                          const Text("flazefy", style: TextStyle(fontSize: 14))
                                        ]
                                      ),
                                    )
                                    
                                  ]
                                )
                              )
                            ],
                          ),
                          const Center(
                            child: Text("It's rainy here"),
                          ),
                          const Center(
                            child: Text("It's sunny here"),
                          ),
                          const Center(
                            child: Text("It's cloudy here"),
                          ),
                        ],
                      ),
                    )
                  ]
                ),
              )
            ),        
          ]
        )
      ),

    );
  }
}