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

  @override
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
                margin: const EdgeInsets.only(left: 20, right: 20),
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
                        icon: const Icon(Icons.add, size: 22, color: Colors.green),
                        label: const Text("Create Group", style: TextStyle(fontSize: 16, color: Colors.green)),
                      )
                    ),
                  ]
                ),
              ),
              Container(
                height: 80.0,
                width: fullWidth,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: const AssetImage('assets/image/users/ZwoKAcQljcJUH7vO1NncRMl1YJ4QoyovJDXfgXHt.jpg'),
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
                      children: const [
                        Text("Meat Lovers", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                        Spacer(),
                        Text("Public", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500))
                      ],
                    ),
                    RichText(
                      text: const TextSpan(                     
                        text: "richardkyle ~ Hello everyone, how are you today?. I have some new sick recipe to share with you all",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),                              
                    ),
                  ]
                ),
              ),
              
            ]
          ),
          ListView(
            padding: const EdgeInsets.only(top: 20),
            children: const []
          )
        ]
      )
      
    );
  }
}