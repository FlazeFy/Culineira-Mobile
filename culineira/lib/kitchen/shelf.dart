import 'package:culineira/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class Shelf extends StatefulWidget {
  Shelf({Key key, this.data}) : super(key: key);
  var data;

  @override
  _ShelfState createState() => _ShelfState();
}

class _ShelfState extends State<Shelf> {
  //Text field contoller.
  final _itemNameCtrl = TextEditingController();
  final _itemDescriptionCtrl = TextEditingController();
  int _itemQtyCtrl;

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    int count = 0;
    var _shelfList = widget.data;

    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _shelfList.length,
        itemBuilder: (context, index) {
          getDate(DateTime datetime) {
            var formattedDate =
                "${datetime.day}-${datetime.month}-${datetime.year} ${datetime.hour}:${datetime.minute}";
            return formattedDate;
          }

          Widget getItemBox() {
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
                        Text(
                            "${_shelfList[index].item_qty}x ${_shelfList[index].item_name}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13)),
                        const Spacer(),
                        Container(
                          transform: Matrix4.translationValues(
                              fullWidth * 0.03, 0.0, 0.0),
                          child: IconButton(
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Text(_shelfList[index].item_description,
                        style: TextStyle(fontSize: 13)),
                    Text(getDate(_shelfList[index].created_at),
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 125, 125, 125),
                            fontStyle: FontStyle.italic))
                  ]),
            );
          }

          if (count == 0) {
            count++;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Text("Shelf",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const Spacer(),
                  Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: TextButton.icon(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            contentPadding: EdgeInsets.all(15),
                            content: SizedBox(
                              height: 360,
                              width: fullWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Ink(
                                      child: IconButton(
                                        icon: const Icon(Icons.close, size: 36),
                                        color: dangerColor,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    child: Text("Add Item",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Text("Name",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: 40,
                                    child: TextField(
                                      controller: _itemNameCtrl,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 5, left: 10, right: 10),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 205, 205),
                                              width: 2.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("Description (Optional)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: 80,
                                    child: TextField(
                                      controller: _itemDescriptionCtrl,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 5, left: 10, right: 10),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 205, 205),
                                              width: 2.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 50,
                                        child: SpinBox(
                                          min: 1,
                                          max: 220,
                                          value: 1,
                                          spacing: 1,
                                          textStyle: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                          onChanged: (value) =>
                                              _itemQtyCtrl = value.toInt(),
                                          decoration: const InputDecoration(
                                              labelText: 'Qty'),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ElevatedButton.icon(
                                          onPressed: () async {
                                            //Create List
                                            var connection =
                                                await setDatabase();
                                            var date =
                                                DateFormat("yyyy-MM-dd h:m:s")
                                                    .format(DateTime.now())
                                                    .toString();

                                            await connection.execute(
                                                "INSERT INTO public.shelf( "
                                                "users_id, item_name, item_description, item_qty, created_at, updated_at) "
                                                "VALUES (${passIdUser}, '${_itemNameCtrl.text}', '${_itemDescriptionCtrl.text}', ${_itemQtyCtrl}, '${date}', '${date}');");

                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.add, size: 18),
                                          label: Text("Create List"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors
                                                .green, // Background color
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.add,
                            size: 22, color: Color.fromARGB(255, 25, 135, 84)),
                        label: const Text("Add Item",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 25, 135, 84))),
                      )),
                  Ink(
                    child: IconButton(
                      icon: const Icon(Icons.delete, size: 26),
                      color: dangerColor,
                      onPressed: () {},
                    ),
                  ),
                ]),
                getItemBox()
              ],
            );
          } else {
            count++;
            return getItemBox();
          }
        });
  }
}
