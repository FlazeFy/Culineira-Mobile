import 'package:culineira/database/model/user.dart';
import 'package:culineira/main.dart';
import 'package:culineira/profile/apps.dart';
import 'package:culineira/profile/edit/index.dart';
import 'package:culineira/profile/others.dart';
import 'package:culineira/profile/setting.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Model
  List<userModel> _userList = <userModel>[];

  //Controller
  Future getMiniProfile() async {
    var connection = await setDatabase();
    _userList = <userModel>[];

    List<Map<String, Map<String, dynamic>>> results =
        await connection.mappedResultsQuery("SELECT * FROM public.users "
            "WHERE id = ${passIdUser} ");

    results.forEach((results) {
      setState(() {
        var userModels = userModel();

        userModels.id = results['users']['id'];
        userModels.email = results['users']['email'];
        userModels.username = results['users']['username'];
        userModels.image_url = results['users']['image_url'];

        _userList.add(userModels);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMiniProfile();
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
          height: fullHeight,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _userList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: fullHeight * 0.08, left: 20, right: 20),
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.all(2.5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                  'assets/storage/${_userList[index].image_url}',
                                  width: 75),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(2.5),
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("@${_userList[index].username}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(_userList[index].email,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width: fullWidth * 0.55,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text("20",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Color(0xFF414141))),
                                            Text("Following",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text("500",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Color(0xFF414141))),
                                            Text("Followers",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text("500",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Color(0xFF414141))),
                                            Text("Recipes",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          const Spacer(),
                          Ink(
                            child: IconButton(
                              icon: const Icon(Icons.edit, size: 26),
                              color: iconMainColor,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const EditProfilePage()));
                              },
                            ),
                          ),
                        ])),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 10),
                      child: const Text("Apps",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                    Apps(),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 10),
                      child: const Text("Setting",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                    const Setting(),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 10),
                      child: const Text("Others",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                    const Others(),
                  ],
                );
              })),
    );
  }
}
