import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class Steps extends StatefulWidget {
  Steps({Key key, this.data}) : super(key: key);
  var data;

  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {

  @override
  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;
    int count = 0;
    var _stepsList = widget.data;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      itemCount : _stepsList.length,
      itemBuilder: (context, index){
        Widget stepsBox(){
          return Container(
            margin: const EdgeInsets.only(bottom: 10, right: 10),
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
                  child: Text("Steps #${count.toString()}", style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w500))
                ),
                Text(_stepsList[index].steps_body, style: TextStyle(color: iconMainColor)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: (){
                        Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (BuildContext context)=>Expansiontile())
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
          );
        }
        
        count++;
        if(count == 1){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(thickness: 1.5)
                    ),       
                    Text("  Steps  ", style: TextStyle(color: iconMainColor, fontWeight: FontWeight.bold, fontSize: 18)),
                    const Expanded(
                      child: Divider(thickness: 1.5)
                    ), 
                  ]
                )
              ),
              SizedBox(
                width: fullWidth,
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: fullWidth*0.05),
                        width: 3,
                        color: primaryColor,
                      ),
                      Container(
                        width: 25,
                        margin: EdgeInsets.symmetric(horizontal: fullWidth*0.025),
                        decoration:  BoxDecoration(
                          color: mainbg,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor,
                            width: 3,
                          )
                        ),    
                      ),
                      Container(
                        width: fullWidth*0.8,
                        transform: Matrix4.translationValues(50.0, 5.0, 0.0),
                        child: Column(
                          children: [
                            stepsBox()
                          ],
                        )
                      ),
                    ],
                  ),
                )
              )
  
            ]
          );
        } else {
          return SizedBox(
            width: fullWidth,
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: fullWidth*0.05),
                    width: 3,
                    color: primaryColor,
                  ),
                  Container(
                    width: 25,
                    margin: EdgeInsets.symmetric(horizontal: fullWidth*0.025),
                    decoration:  BoxDecoration(
                      color: mainbg,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: primaryColor,
                        width: 3,
                      )
                    ),    
                  ),
                  Container(
                    width: fullWidth*0.8,
                    transform: Matrix4.translationValues(50.0, 5.0, 0.0),
                    child: Column(
                      children: [
                        stepsBox()
                      ],
                    )
                  ),
                ],
              ),
            )
          );
        }
      }
    );
  }
}

class Expansiontile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Steps #1 '
        ),
      ),
      body: ListView(
        children: [

        ],
      )
    );
  }
}