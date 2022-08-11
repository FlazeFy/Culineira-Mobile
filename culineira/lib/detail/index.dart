import 'package:culineira/database/model/ingredient.dart';
import 'package:culineira/database/model/recipe.dart';
import 'package:culineira/detail/Ingredients.dart';
import 'package:culineira/main.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<recipeModel> _recipeList = <recipeModel>[];

  Future getRecipeId() async {
    var connection =  await setDatabase();
    _recipeList = <recipeModel>[];
    
    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    "SELECT * FROM public.recipes join public.users on public.recipes.user_id = public.users.id " 
    "WHERE recipes.id = ${passIdRecipe}");

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
        recipeModels.recipe_desc = results['recipes']['recipe_desc'];
        recipeModels.recipe_video = results['recipes']['recipe_video'];
        recipeModels.created_at = results['recipes']['created_at'];
        recipeModels.updated_at = results['recipes']['updated_at'];
        recipeModels.user_image = results['users']['image_url'];

        _recipeList.add(recipeModels);
      });
    });
  }

  List<ingredientsModel> _ingredientsList = <ingredientsModel>[];

  Future getIngredients() async {
    var connection =  await setDatabase();
    _ingredientsList = <ingredientsModel>[];
    
    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    "SELECT * FROM public.ingredients join public.recipes on public.recipes.id = public.ingredients.recipe_id " 
    "WHERE ingredients.recipe_id = ${passIdRecipe} ");

    results.forEach((results){
      setState((){
        var ingredientsModels = ingredientsModel();
        
        ingredientsModels.id = results['ingredients']['id'];
        ingredientsModels.ingredients_name = results['ingredients']['ingredients_name'];
        ingredientsModels.ingredients_vol = results['ingredients']['ingredients_vol'];
        ingredientsModels.ingredients_type = results['ingredients']['ingredients_type'];

        _ingredientsList.add(ingredientsModels);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    getRecipeId();
    getIngredients();
    
  }
  
  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    getDate(DateTime datetime){
      var formattedDate = "${datetime.day}-${datetime.month}-${datetime.year} ${datetime.hour}:${datetime.minute}";
      return formattedDate;
    }

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
        child: ListView.builder(
          itemCount : _recipeList.length,
          itemBuilder: (context, index){
            return DefaultTabController(
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
                                'assets/storage/${_recipeList[index].recipe_url}', scale: 1.3),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(_recipeList[index].recipe_name, style: TextStyle(color: iconMainColor, fontSize: 22, fontWeight: FontWeight.bold)),
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
                                          child: Text(_recipeList[index].recipe_level, style: TextStyle(color: secondaryColor)),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const WidgetSpan(
                                                child: Icon(Icons.punch_clock, size: 16),
                                              ),
                                              TextSpan(
                                                text: " ${_recipeList[index].recipe_time_spend} min",
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
                                          label: Text("...", style: TextStyle(color: dangerColor)),
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
                                                    text: _recipeList[index].recipe_type,
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
                                                    text: _recipeList[index].recipe_country,
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
                                                    text: "${_recipeList[index].recipe_calorie} cal",
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
                                                    text: "${_recipeList[index].recipe_main_ing} ",
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
                                      child: Text(_recipeList[index].recipe_desc),
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
                                                    text: getDate(_recipeList[index].created_at.toUtc()),
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
                                                    text: getDate(_recipeList[index].updated_at.toUtc()),
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
                                              'assets/storage/${_recipeList[index].user_image}', width: 45),
                                            ),
                                          ),
                                          Text(_recipeList[index].username, style: TextStyle(fontSize: 14))
                                        ]
                                      ),
                                    )
                                    
                                  ]
                                )
                              )
                            ],
                          ),
                          Ingredients(data : _ingredientsList),
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
            );       
          }
        )
      ),

    );
  }
}