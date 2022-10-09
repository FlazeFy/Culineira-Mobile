import 'package:culineira/database/model/comment.dart';
import 'package:culineira/main.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:full_screen_menu/full_screen_menu.dart';
import 'package:intl/intl.dart';

class CommentPage extends StatefulWidget {
  CommentPage(
      {Key key,
      this.passIdRecipe,
      this.passIdSteps,
      this.stepsNo,
      this.steps_body,
      this.recipeOwner})
      : super(key: key);
  int passIdRecipe;
  int passIdSteps;
  int stepsNo;
  int recipeOwner;
  String steps_body;

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  //Model
  List<commentModel> _commentList = <commentModel>[];

  //Text field contoller.
  final _commentBodyCtrl = TextEditingController();

  //Controller
  Future getComment() async {
    var connection = await setDatabase();
    _commentList = <commentModel>[];

    List<Map<String, Map<String, dynamic>>> results =
        await connection.mappedResultsQuery("SELECT * FROM public.comment "
            "JOIN public.users ON comment.users_id = users.id "
            "WHERE steps_id = ${widget.passIdSteps} ");

    results.forEach((results) {
      setState(() {
        var commentModels = commentModel();

        commentModels.id = results['comment']['id'];
        commentModels.users_id = results['users']['id'];
        commentModels.username = results['users']['username'];
        commentModels.comment_body = results['comment']['comment_body'];
        commentModels.comment_image = results['comment']['comment_image'];
        commentModels.image_url = results['users']['image_url'];
        commentModels.created_at = results['comment']['created_at'];

        _commentList.add(commentModels);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getComment();
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    getDate(DateTime datetime) {
      var formattedDate =
          "${datetime.day}-${datetime.month}-${datetime.year} ${datetime.hour}:${datetime.minute}";
      return formattedDate;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment"),
        actions: [],
        backgroundColor: primaryColor,
      ),
      body: SizedBox(
        height: fullHeight,
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 128, 128, 128)
                          .withOpacity(0.3),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        5.0,
                        5.0,
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
                        child: Text("Steps #${widget.stepsNo}",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500))),
                    Text(widget.steps_body,
                        style: TextStyle(color: iconMainColor)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextButton.icon(
                          icon: Icon(Icons.chat_bubble,
                              size: 18, color: primaryColor),
                          label: Text(
                            'Comment',
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Flexible(
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    itemCount: _commentList.length,
                    itemBuilder: (context, index) {
                      //Store property.
                      var sender;
                      var position;
                      String name;

                      Widget getProfileImage() {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                              'assets/storage/${_commentList[index].image_url}',
                              width: 40),
                        );
                      }

                      Widget getChatBubble() {
                        return ChatBubble(
                          clipper: ChatBubbleClipper1(type: sender),
                          margin: const EdgeInsets.only(top: 20),
                          alignment: position,
                          backGroundColor: Colors.white,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "${name} ",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 15)),
                                        TextSpan(
                                            text:
                                                " ${getDate(_commentList[index].created_at.toUtc())}",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      _commentList[index].comment_body,
                                      style: const TextStyle(
                                          color: const Color(0xFF414141)),
                                    ),
                                  )
                                ],
                              )),
                        );
                      }

                      //Get comment by sender.
                      if (_commentList[index].users_id == passIdUser) {
                        sender = BubbleType.sendBubble;
                        position = Alignment.topRight;
                        name = "You";
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [getChatBubble(), getProfileImage()]);
                        // } else if (_commentList[index].users_id == widget.recipeOwner){
                        //   sender = BubbleType.receiverBubble;
                        //   position = Alignment.topLeft;
                        //   name = "Contributor";
                        // NOTE : Comment from contributor must only have bordered chat bubble. But this plugin doesnt support with border.
                      } else {
                        sender = BubbleType.receiverBubble;
                        position = Alignment.topLeft;
                        name = _commentList[index].username;
                        return Row(children: [
                          getProfileImage(),
                          getChatBubble(),
                        ]);
                      }
                    })),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        //Bug : not close after back button is pressed
                        FullScreenMenu.show(
                          context,
                          backgroundColor: Colors.white,
                          items: [
                            FSMenuItem(
                              icon: const Icon(Icons.mic, color: Colors.white),
                              text: Text('Audio',
                                  style: TextStyle(color: primaryColor)),
                              gradient: blueGradient,
                            ),
                            FSMenuItem(
                              icon: const Icon(Icons.file_copy,
                                  color: Colors.white),
                              text: Text('Document',
                                  style: TextStyle(color: primaryColor)),
                              gradient: purpleGradient,
                            ),
                            FSMenuItem(
                              icon:
                                  const Icon(Icons.image, color: Colors.white),
                              text: Text('Image',
                                  style: TextStyle(color: primaryColor)),
                              gradient: redGradient,
                            ),
                          ],
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.white,
                            size: 20), //Icon must be paperclip
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _commentBodyCtrl,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: "Type your comment",
                            hintStyle: TextStyle(color: Colors.grey),
                            focusColor: Colors.grey,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        var connection = await setDatabase();
                        var date = DateFormat("yyyy-MM-dd h:m:s")
                            .format(DateTime.now())
                            .toString();

                        await connection.execute(
                            "INSERT INTO public.comment(recipe_id, steps_id, users_id, comment_body, comment_image, created_at, updated_at) "
                            "VALUES (${widget.passIdRecipe}, ${widget.passIdSteps}, ${passIdUser}, '${_commentBodyCtrl.text}', 'null', '${date}', '${date}');");

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => CommentPage(
                                    passIdRecipe: widget.passIdRecipe,
                                    passIdSteps: widget.passIdSteps,
                                    stepsNo: widget.stepsNo,
                                    steps_body: widget.steps_body,
                                    recipeOwner: widget.recipeOwner)));
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: primaryColor,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
