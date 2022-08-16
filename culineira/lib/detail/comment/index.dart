import 'dart:ui';

import 'package:culineira/database/model/comment.dart';
import 'package:culineira/main.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  CommentPage({Key key, this.passIdSteps, this.stepsNo, this.steps_body}) : super(key: key);
  int passIdSteps;
  int stepsNo;
  String steps_body;


  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  //Model
  List<commentModel> _commentList = <commentModel>[];

  //Controller
  Future getComment() async {
    var connection =  await setDatabase();
    _commentList = <commentModel>[];
    
    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    "SELECT * FROM public.comment "
    "JOIN public.users ON comment.users_id = users.id " 
    "WHERE steps_id = ${widget.passIdSteps} ");

    results.forEach((results){
      setState((){
        var commentModels = commentModel();
        
        commentModels.id = results['comment']['id'];
        commentModels.username = results['users']['username'];
        commentModels.comment_body = results['comment']['comment_body'];
        commentModels.comment_image = results['comment']['comment_image'];
        commentModels.created_at = results['comment']['created_at'];

        _commentList.add(commentModels);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    getComment();
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
        title: Text("Comment"),
        actions: [
          
        ],
        backgroundColor: primaryColor,
      ),
      body: SizedBox(
        height: fullHeight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 128, 128, 128).withOpacity(0.3),
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: const Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text("Steps #${widget.stepsNo}", style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w500))
                  ),
                  Text(widget.steps_body, style: TextStyle(color: iconMainColor)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (BuildContext context)=> CommentPage())
                          );
                        },
                        icon: Icon(Icons.chat_bubble, size: 18, color: primaryColor),
                        label: Text(
                          'Comment', style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
            Container(
              height: fullHeight*0.7,
              width: fullWidth,
              child: ListView.builder(
                itemCount : _commentList.length,
                itemBuilder: (context, index){
                  return Container(
                    alignment: Alignment.centerLeft,
                    width: 20,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 128, 128, 128).withOpacity(0.3),
                          blurRadius: 10.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: const Offset(
                            5.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: Container(
                      width: fullWidth*0.55, 
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(_commentList[index].username, style: TextStyle(color: primaryColor)),
                              Spacer(),
                              Text(getDate(_commentList[index].created_at.toUtc()), style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ]
                          ),
                          Text(_commentList[index].comment_body, style: TextStyle(color: iconMainColor))
                        ],
                      )
                    )
                  );
                }
              )
            )
          ],
        ),
      ),

    );
  }
}