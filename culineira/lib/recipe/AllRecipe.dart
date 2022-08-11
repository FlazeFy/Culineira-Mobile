import 'package:culineira/database/model/recipe.dart';
import 'package:culineira/detail/DetailPage.dart';
import 'package:culineira/main.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';

class AllRecipe extends StatefulWidget {
  const AllRecipe({Key key}) : super(key: key);

  @override
  _AllRecipeState createState() => _AllRecipeState();
}

class _AllRecipeState extends State<AllRecipe> {
  List<recipeModel> _recipeList = <recipeModel>[];

  Future getAllRecipe() async {
    var connection =  await setDatabase();
    _recipeList = <recipeModel>[];
    
    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    "SELECT * FROM public.recipes join public.users on public.recipes.user_id = public.users.id " 
    "ORDER BY recipes.updated_at");

    results.forEach((results){
      setState((){
        var recipeModels = recipeModel();
        
        recipeModels.id = results['recipes']['id'];
        recipeModels.recipe_name = results['recipes']['recipe_name'];
        recipeModels.username = results['users']['username'];
        recipeModels.recipe_calorie = results['recipes']['recipe_calorie'];
        recipeModels.recipe_time_spend = results['recipes']['recipe_time_spend'];
        recipeModels.recipe_main_ing = results['recipes']['recipe_main_ing'];
        recipeModels.recipe_country = results['recipes']['recipe_country'];
        recipeModels.recipe_level = results['recipes']['recipe_level'];
        recipeModels.recipe_type = results['recipes']['recipe_type'];
        recipeModels.recipe_url = results['recipes']['recipe_url'];

        _recipeList.add(recipeModels);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    getAllRecipe();
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    //Get recipe based on recipe type
    Widget getRecipeCard(String type){
      if(type == "All"){
        return ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 60),
          itemCount : _recipeList.length,
          itemBuilder: (context, index){
            return GestureDetector( 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage()),
                );
              },
              child: Container(
                width: fullWidth,
                height: 175,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 128, 128, 128).withOpacity(0.3),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                'assets/storage/${_recipeList[index].recipe_url}', width: fullWidth*0.32),
                              ),
                            ),
                            Container(
                              width: fullWidth*0.33,
                              transform: Matrix4.translationValues(0.0, 80.0, 0.0),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.asset(
                                      'assets/image/country/${_recipeList[index].recipe_country}.png', width: 45),
                                    ),
                                  ),
                                  const Spacer(),
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.asset(
                                      'assets/image/users/user_rosemonde.jpg', width: 45),
                                    ),
                                  ),
                                ],
                              )
                            )
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Container(
                              child: Text(_recipeList[index].recipe_name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10, top: 5),
                              width: fullWidth*0.5,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xFFF0f0f0),
                              ),
                              child: Row(
                                children: [
                                  Text(_recipeList[index].recipe_level, style: const TextStyle(color: Colors.green)),
                                  const Spacer(),
                                  Text(_recipeList[index].recipe_type, style: const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: fullWidth*0.5,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(_recipeList[index].recipe_time_spend.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF414141))),
                                      const Text("min", style: TextStyle(color: Color(0xFF414141))),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(_recipeList[index].recipe_calorie.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF414141))),
                                      const Text("cal", style: TextStyle(color: Color(0xFF414141))),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    alignment: Alignment.center,
                                    width: fullWidth*0.2,
                                    child: Text(_recipeList[index].recipe_main_ing, style: const TextStyle(color: Color(0xFF414141))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            );
          }
        );
      } else {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 60),
          itemCount : _recipeList.length,
          itemBuilder: (context, index){
            if(_recipeList[index].recipe_type == type){
              return GestureDetector( 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailPage()),
                  );
                },
                child: Container(
                  width: fullWidth,
                  height: 175,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 128, 128, 128).withOpacity(0.3),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: const Offset(
                          5.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                  'assets/storage/${_recipeList[index].recipe_url}', width: fullWidth*0.32),
                                ),
                              ),
                              Container(
                                width: fullWidth*0.33,
                                transform: Matrix4.translationValues(0.0, 80.0, 0.0),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
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
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image.asset(
                                        'assets/image/country/${_recipeList[index].recipe_country}.png', width: 45),
                                      ),
                                    ),
                                    const Spacer(),
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
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image.asset(
                                        'assets/image/users/user_rosemonde.jpg', width: 45),
                                      ),
                                    ),
                                  ],
                                )
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Container(
                                child: Text(_recipeList[index].recipe_name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10, top: 5),
                                width: fullWidth*0.5,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color(0xFFF0f0f0),
                                ),
                                child: Row(
                                  children: [
                                    Text(_recipeList[index].recipe_level, style: const TextStyle(color: Colors.green)),
                                    const Spacer(),
                                    Text(_recipeList[index].recipe_type, style: const TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: fullWidth*0.5,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(_recipeList[index].recipe_time_spend.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF414141))),
                                        const Text("min", style: TextStyle(color: Color(0xFF414141))),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        Text(_recipeList[index].recipe_calorie.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF414141))),
                                        const Text("cal", style: TextStyle(color: Color(0xFF414141))),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      width: fullWidth*0.2,
                                      child: Text(_recipeList[index].recipe_main_ing, style: const TextStyle(color: Color(0xFF414141))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              );
            } else {
              return SizedBox();
            }
          }
        );
      }
    }
    
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
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
                  text: "All",
                ),
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
            SizedBox(
              height: fullHeight*0.7,
              child: TabBarView(
                children: <Widget>[
                  getRecipeCard("All"),
                  getRecipeCard("Main Course"),
                  getRecipeCard("Appetizer"),
                  getRecipeCard("Desserts"),
                  const Center(
                    child: Text("It's rainy here"),
                  ),
                  const Center(
                    child: Text("It's sunny here"),
                  ),
                  const Center(
                    child: Text("It's cloudy here"),
                  )
                ],
              ),
            )
          ]
        ),
      )
            );
  }
}