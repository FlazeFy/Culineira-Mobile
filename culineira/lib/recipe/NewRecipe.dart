import 'package:culineira/detail/index.dart';
import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class NewRecipe extends StatefulWidget {
  NewRecipe({Key key, this.data}) : super(key: key);
  var data;

  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    var _newRecipeList = widget.data;
    int count = 0;

    //Create new recipe button
    Widget getCreate(){
      return GestureDetector(
        onTap: (){
          //
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children:[
                  Container(
                    height: 65,
                    width: 65,
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
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(18),
                  child: Image.asset('assets/image/icon/Add.png', fit: BoxFit.cover),
                ),
              )
            ),
          ],
        )
      );
    }

    //Condition if there's a new recipe
    Widget getBody(){
      if(_newRecipeList.length != 0){
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 5),
            itemCount : _newRecipeList.length,
            itemBuilder: (context, index){

              return GestureDetector(
                onTap: () async {
                  passIdRecipe = _newRecipeList[index].id.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailPage()),
                  );
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
                          child: Image.asset('assets/storage/${_newRecipeList[index].recipe_url}', fit: BoxFit.cover),
                        ),
                      )
                    ),
                    Container(
                      width: 80,
                      child: Text(_newRecipeList[index].recipe_name, style: TextStyle(fontSize: 12,), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
                    )
                  ]
                ),
              );
            }
          )
        );
      } else {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10, left: fullWidth*0.15),
          child: Column(
            children: [
              Container(
                height: 80,
                child: ClipRect(
                  child: Image.asset('assets/storyset/norecipe.png', fit: BoxFit.cover),
                )
              ),
              Text("Sorry, no recipe available", style: TextStyle(color: iconMainColor, fontSize: 12.5))
            ],
          )
        );
      }
    }
    
    //New recipe section
    return Expanded(
      child: Container(
        height: 160,
        width: fullWidth,
        margin: const EdgeInsets.only(left: 10, top: 15),
        padding: const EdgeInsets.only(top: 10, left: 10),
        color: Colors.white,
        child: Column( 
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text("New Recipes this week", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: getCreate(),
                  ),
                  getBody()
                ],
              )
            )
          ]
        )
      )
    );
  }
}