import 'package:flutter/material.dart';

class UnfinishedRecipe extends StatefulWidget {
  const UnfinishedRecipe({Key key}) : super(key: key);

  @override
  _UnfinishedRecipeState createState() => _UnfinishedRecipeState();
}

class _UnfinishedRecipeState extends State<UnfinishedRecipe> {
  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                child: Icon(Icons.warning_rounded, size: 20, color: Colors.black),
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
                    child: Stack(
                      children: [
                        Column(
                          children:[
                            Container(
                              height: 80,
                              width: 80,
                              margin: const EdgeInsets.only(bottom:5),
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
                        Container(
                          height: 35,
                          width: 35,
                          transform: Matrix4.translationValues(0.0, 40.0, 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
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
                          child: Container(
                            padding: const EdgeInsets.all(2.5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                              'assets/image/icon/Continue.png'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              )
            )
          )
        ],
      ),
    );
  }
}