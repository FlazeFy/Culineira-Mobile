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
    // double fullHeight = MediaQuery.of(context).size.height;
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
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13)),
                        const Spacer(),
                        Container(
                          transform: Matrix4.translationValues(
                              fullWidth * 0.03, 0.0, 0.0),
                          child: IconButton(
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                contentPadding: const EdgeInsets.all(15),
                                content: SizedBox(
                                  height: 360,
                                  width: fullWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Ink(
                                          child: IconButton(
                                            icon: const Icon(Icons.close,
                                                size: 36),
                                            color: dangerColor,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: const Text("Edit Item",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      const Text("Name",
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
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    right: 10),
                                            border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 205, 205, 205),
                                                  width: 2.0),
                                            ),
                                            hintText:
                                                _shelfList[index].item_name,
                                          ),
                                        ),
                                      ),
                                      const Text("Description (Optional)",
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
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    right: 10),
                                            border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 205, 205, 205),
                                                  width: 2.0),
                                            ),
                                            hintText: _shelfList[index]
                                                .item_description,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: SpinBox(
                                              min: 1,
                                              max: 220,
                                              value:
                                                  _shelfList[index].item_qty *
                                                      1.0,
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
                                          const Spacer(),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: ElevatedButton.icon(
                                              onPressed: () async {
                                                //Inital variable.
                                                var itemName;
                                                var itemDesc;
                                                int itemQty;

                                                //Edit item in shelf
                                                var connection =
                                                    await setDatabase();
                                                var date = DateFormat(
                                                        "yyyy-MM-dd h:m:s")
                                                    .format(DateTime.now())
                                                    .toString();

                                                //Validate empty
                                                if (_itemNameCtrl
                                                    .text.isEmpty) {
                                                  itemName = _shelfList[index]
                                                      .item_name;
                                                } else {
                                                  itemName = _itemNameCtrl.text;
                                                }
                                                if (_itemDescriptionCtrl
                                                    .text.isEmpty) {
                                                  itemDesc = _shelfList[index]
                                                      .item_description;
                                                } else {
                                                  itemDesc =
                                                      _itemDescriptionCtrl.text;
                                                }
                                                if (_itemQtyCtrl == null) {
                                                  itemQty = _shelfList[index]
                                                      .item_qty;
                                                } else {
                                                  itemQty = _itemQtyCtrl;
                                                }

                                                await connection.execute(
                                                    "UPDATE public.shelf SET item_name='${itemName}', item_description='${itemDesc}', item_qty=${itemQty}, updated_at='${date}' "
                                                    "WHERE id = ${_shelfList[index].id};");

                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.save,
                                                  size: 18),
                                              label: const Text("Save Changes"),
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
                          ),
                        ),
                      ],
                    ),
                    Text(_shelfList[index].item_description,
                        style: const TextStyle(fontSize: 13)),
                    Text(getDate(_shelfList[index].created_at),
                        style: const TextStyle(
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
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            contentPadding: const EdgeInsets.all(15),
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
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: const Text("Add Item",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  const Text("Name",
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
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 5, left: 10, right: 10),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 205, 205),
                                              width: 2.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text("Description (Optional)",
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
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 5, left: 10, right: 10),
                                        border: OutlineInputBorder(
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
                                      SizedBox(
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
                                      const Spacer(),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
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
                                          icon: const Icon(Icons.add, size: 18),
                                          label: const Text("Create List"),
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
