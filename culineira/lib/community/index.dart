import 'package:culineira/community/group.dart';
import 'package:culineira/database/model/group_rel.dart';
import 'package:culineira/database/model/message.dart';
import 'package:culineira/main.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with TickerProviderStateMixin {
  TabController _tabController;
  //Model.
  List<groupRelModel> _groupList = <groupRelModel>[];
  List<messageModel> _lastMessageList = <messageModel>[];

  //Controller.
  Future getgroupId() async {
    var connection =  await setDatabase();
    _groupList = <groupRelModel>[];
    
    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    "SELECT * FROM public.groups_rel "
    "join public.groups on public.groups.id = public.groups_rel.groups_id "
    "join public.users on public.groups.users_id = public.users.id " 
    "WHERE groups_rel.users_id = ${passIdUser} "
    "ORDER BY groups_rel.created_at ");

    results.forEach((results){
      setState((){
        var groupModels = groupRelModel();
        
        groupModels.id = results['groups']['id'];
        groupModels.groups_image = results['groups']['groups_image'];
        groupModels.groups_name = results['groups']['groups_name'];
        groupModels.groups_type = results['groups']['groups_type'];

        _groupList.add(groupModels);
      });
    });
  }

  Future getMessageId() async {
    var connection =  await setDatabase();
    _lastMessageList = <messageModel>[];
    
    List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    "SELECT username, message_body, groups.id, message.created_at FROM public.message "
    "JOIN public.groups on public.groups.id = public.message.groups_id "
    "JOIN public.users on public.users.id = public.message.users_id "
    "ORDER BY message.created_at desc ");

    results.forEach((results){
      setState((){
        var messageModels = messageModel();
        
        messageModels.id = results['groups']['id'];
        messageModels.message_body = results['message']['message_body'];
        messageModels.username = results['users']['username'];
        messageModels.created_at = results['message']['created_at'];

        _lastMessageList.add(messageModels);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getgroupId();
    getMessageId();
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
          Group(data: _groupList, data2: _lastMessageList),
          ListView(
            padding: const EdgeInsets.only(top: 20),
            children: const []
          )
        ]
      )
      
    );
  }
}