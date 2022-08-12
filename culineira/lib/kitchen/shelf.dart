import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class Shelf extends StatefulWidget {
  Shelf({Key key, this.data}) : super(key: key);
  var data;

  @override
  _ShelfState createState() => _ShelfState();
}

class _ShelfState extends State<Shelf> {

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    int count = 0;
    var _shelfList = widget.data;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount : _shelfList.length,
      itemBuilder: (context, index){

        getDate(DateTime datetime){
          var formattedDate = "${datetime.day}-${datetime.month}-${datetime.year} ${datetime.hour}:${datetime.minute}";
          return formattedDate;
        }

        Widget getItemBox(){
          return Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            margin: const EdgeInsets.only(top: 5, right: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("${_shelfList[index].item_qty}x ${_shelfList[index].item_name}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                    const Spacer(),
                    Container(
                      transform: Matrix4.translationValues(fullWidth*0.03, 0.0, 0.0),
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 20),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Text(_shelfList[index].item_description, style: TextStyle(fontSize: 13)),
                Text(getDate(_shelfList[index].created_at), style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 125, 125, 125), fontStyle: FontStyle.italic))
              ]
            ),
          );
        } 

        if(count == 0){
          count++;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children:[
                  const Text("Shelf", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: TextButton.icon(
                      onPressed: () {
                          // Respond to button press
                      },
                      icon: const Icon(Icons.add, size: 22, color: Color.fromARGB(255, 25, 135, 84)),
                      label: const Text("Add Item", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 25, 135, 84))),
                    )
                  ),
                  Ink(
                    child: IconButton(
                      icon: const Icon(Icons.delete, size: 26),
                      color: dangerColor,
                      onPressed: () {},
                    ),
                  ),
                ]
              ),
              getItemBox()
            ],
          );
        } else {
          count++;
          return getItemBox();
        }
      }
    );
  }
}