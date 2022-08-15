import 'package:culineira/main.dart';
import 'package:culineira/others/checkbox.dart';
import 'package:flutter/material.dart';

class RecipeInList extends StatefulWidget {
  RecipeInList({Key key, this.data, this.listId}) : super(key: key);
  var data;
  int listId;

  @override
  _RecipeInListState createState() => _RecipeInListState();
}

class _RecipeInListState extends State<RecipeInList> {

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    int count = 0;
    var _recipeInList = widget.data;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      itemCount : _recipeInList.length,
      itemBuilder: (context, index){
        
        if(_recipeInList[index].list_id == widget.listId){
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: Row(
              children: [
                Text(_recipeInList[index].recipe_name, style: TextStyle(color: Color(0xFF414141))),
                Spacer(),
                Text(_recipeInList[index].recipe_type, style: TextStyle(color: Color(0xFF414141)))
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      }
    );
  }
}