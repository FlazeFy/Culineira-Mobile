import 'package:culineira/database/model/recipe.dart';
import 'package:culineira/detail/DetailPage.dart';
import 'package:culineira/main.dart';
import 'package:culineira/recipe/AllRecipe.dart';
import 'package:culineira/recipe/NewRecipe.dart';
import 'package:culineira/recipe/UnfinishedRecipe.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

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
                      onPressed: ()async{
                        
                      },
                    )
                  )
                ],
              ),
            ),
            NewRecipe(),
            UnfinishedRecipe(),
            AllRecipe()       
          ]
        )
      ),

    );
  }
}