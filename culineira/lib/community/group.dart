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
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    var _groupList = widget.data;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      itemCount : _groupList.length,
      itemBuilder: (context, index){

        Widget getLastMsg(){
          int id = _groupList[index].id;
          var _messageList = widget.data2;
          int count = 0;

          return Container(
            height: 20,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount : _messageList.length,
              itemBuilder: (context, index){
                if(_messageList[index].id == id){
                  if(count == 0){
                    count++;
                    return RichText(
                      text: TextSpan(                     
                        text: "${_messageList[index].username} ~ ${_messageList[index].message_body}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),                              
                    );
                  } 
                } 
              }
            )
          );
        }
        
        return Container(
          height: 80.0,
          width: fullWidth,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/storage/${_groupList[index].groups_image}'),
              colorFilter: 
                ColorFilter.mode(Colors.black.withOpacity(0.5), 
                BlendMode.darken
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_groupList[index].groups_name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Text(_groupList[index].groups_type, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500))
                ],
              ),
              // LastMessage(data: widget.data2, id_group: _groupList[index].id)
              getLastMsg()
            ]
          ),
        );
      
      }
    );
  }
}