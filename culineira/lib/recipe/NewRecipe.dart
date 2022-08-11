import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({Key key}) : super(key: key);

  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    
    return Expanded(
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
                    child: Stack(
                      children: [
                        Column(
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
                        Container(
                          height: 40,
                          width: 40,
                          transform: Matrix4.translationValues(0.0, 30.0, 0.0),
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
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(18),
                              child: Image.asset('assets/image/icon/Add.png', fit: BoxFit.cover),
                            ),
                          )
                        ),
                      ],
                    )
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
    );
  }
}