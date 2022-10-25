import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class Ingredients extends StatefulWidget {
  Ingredients({Key key, this.data}) : super(key: key);
  var data;

  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;
    int count = 0;
    var _ingredientsList = widget.data;

    return ListView.builder(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        itemCount: _ingredientsList.length,
        itemBuilder: (context, index) {
          if (_ingredientsList[index].ingredients_type == "Required") {
            if (count == 0) {
              count++;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(children: <Widget>[
                        const Expanded(child: Divider(thickness: 1.5)),
                        Text("  Ingredients  ",
                            style: TextStyle(
                                color: iconMainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        const Expanded(child: Divider(thickness: 1.5)),
                      ])),
                  Container(
                      margin: const EdgeInsets.only(top: 2),
                      child: Text(
                          "${_ingredientsList[index].ingredients_vol} - ${_ingredientsList[index].ingredients_name}",
                          style: TextStyle(color: iconMainColor, fontSize: 16)))
                ],
              );
            } else {
              count++;
              return Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: Text(
                      "${_ingredientsList[index].ingredients_vol} - ${_ingredientsList[index].ingredients_name}",
                      style: TextStyle(color: iconMainColor, fontSize: 16)));
            }
          } else {
            count++;
            return Container(
                margin: const EdgeInsets.only(top: 2),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: iconMainColor, fontSize: 17),
                    children: [
                      const TextSpan(
                          text: "(Optional) ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            "${_ingredientsList[index].ingredients_vol} - ${_ingredientsList[index].ingredients_name}",
                      )
                    ],
                  ),
                ));
          }
        });
  }
}
