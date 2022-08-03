import 'package:culineira/main.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    double fullHeight =  MediaQuery.of(context).size.height;
    double fullWidth =  MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: SizedBox(
          width: fullWidth,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                width: fullWidth*0.75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "groupname or username",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                )
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.sort, size: 26),
                  color: Colors.white,
                  onPressed: () {},
                )
              )
            ],
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: primaryColor,
          indicatorColor: primaryColor,
          unselectedLabelColor: iconMainColor,
          tabs: const <Widget>[
            Tab(
              text: "My Community",
            ),
            Tab(
              text: "Global",
            )
          ],
        ),
        backgroundColor: mainbg,
      ),
      body: TabBarView (
        controller: _tabController,
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.only(top: 10),
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children:[
                    const Text("3 Group", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: TextButton.icon(
                        onPressed: () {
                            // Respond to button press
                        },
                        icon: Icon(Icons.add, size: 22, color: Colors.green),
                        label: Text("Create Group", style: TextStyle(fontSize: 16, color: Colors.green)),
                      )
                    ),
                  ]
                ),
              ),
              
            ]
          ),
          ListView(
            padding: const EdgeInsets.only(top: 20),
            children: []
          )
        ]
      )
      
    );
  }
}