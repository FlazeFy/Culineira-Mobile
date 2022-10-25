import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  Group({Key key, this.data, this.data2}) : super(key: key);
  var data;
  var data2;

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    var _groupList = widget.data;
    var _messageList = widget.data2;
    int i = 0;

    return ListView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemCount: _groupList.length,
        itemBuilder: (context, index) {
          Widget getLastMsg() {
            int id = _groupList[index].id;
            int count = 0;
            return SizedBox(
                height: 20,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: _messageList.length,
                    itemBuilder: (context, index2) {
                      if (_messageList[index2].id == id) {
                        if (count == 0) {
                          count++;
                          return RichText(
                            text: TextSpan(
                              text:
                                  "${_messageList[index2].username} ~ ${_messageList[index2].message_body}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }
                      }
                    }));
          }

          Widget getContactBox() {
            return Container(
              height: 80.0,
              width: fullWidth,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                      'assets/storage/${_groupList[index].groups_image}'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_groupList[index].groups_name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Text(_groupList[index].groups_type,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                // LastMessage(data: widget.data2, id_group: _groupList[index].id)
                getLastMsg()
              ]),
            );
          }

          if (i == 0) {
            i++;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(children: [
                    const Text("3 Group",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    const Spacer(),
                    Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: TextButton.icon(
                          onPressed: () {
                            // Respond to button press
                          },
                          icon: const Icon(Icons.add,
                              size: 22, color: Colors.green),
                          label: const Text("Create Group",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green)),
                        )),
                  ]),
                ),
                getContactBox()
              ],
            );
          } else {
            return getContactBox();
          }
        });
  }
}
