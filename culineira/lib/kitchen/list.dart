import 'package:culineira/main.dart';
import 'package:culineira/others/checkbox.dart';
import 'package:flutter/material.dart';

class ListRecipe extends StatefulWidget {
  ListRecipe({Key key, this.data}) : super(key: key);
  var data;

  @override
  _ListRecipeState createState() => _ListRecipeState();
}

class _ListRecipeState extends State<ListRecipe> {

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    int count = 0;
    var _listRecipeList = widget.data;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount : _listRecipeList.length,
      itemBuilder: (context, index){

        getDate(DateTime datetime){
          var formattedDate = "${datetime.day}-${datetime.month}-${datetime.year}";
          return formattedDate;
        }

        //Change list status.
        Widget getStarred(String star){
          if(star == "null"){
            return Ink(
              child: IconButton(
                icon: const Icon(Icons.star_border_outlined, size: 22),
                onPressed: () {},
              ),
            );
          } else {
            return Ink(
              child: IconButton(
                icon: Icon(Icons.star, color: Colors.amber.shade700, size: 22),
                onPressed: () {},
              ),
            );
          }
        }
        
        return GestureDetector(
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
                    getStarred(_listRecipeList[index].list_status),
                    const Spacer(),
                    Text(_listRecipeList[index].list_name, style: TextStyle(fontWeight: FontWeight.w500)),
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
                        children: [
                          Text(getDate(_listRecipeList[index].updated_at.toUtc()), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF414141))),
                          Text("Updated At", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(_listRecipeList[index].list_description, 
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
        );
       
      }
    );
  }
}