import 'package:culineira/database/model/user.dart';
import 'package:culineira/main.dart';
import 'package:culineira/services/connect.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //Model
  List<userModel> _userList = <userModel>[];

  //Text field contoller.
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _countryCtrl = TextEditingController();

  final _scmFacebook = TextEditingController();
  final _scmYoutube = TextEditingController();
  final _scmTiktok = TextEditingController();
  final _scmInstagram = TextEditingController();
  final _scmLinkedin = TextEditingController();

  //Controller
  Future getFullProfile() async {
    var connection = await setDatabase();
    _userList = <userModel>[];

    List<
        Map<
            String,
            Map<String,
                dynamic>>> results = await connection.mappedResultsQuery(
        "SELECT * FROM public.users JOIN public.socmed ON socmed.users_id = users.id "
        "WHERE users.id = ${passIdUser} ");

    results.forEach((results) {
      setState(() {
        var userModels = userModel();

        userModels.id = results['users']['id'];
        userModels.email = results['users']['email'];
        userModels.username = results['users']['username'];
        userModels.password = results['users']['password'];
        userModels.country = results['users']['country'];
        userModels.description = results['users']['description'];
        userModels.image_url = results['users']['image_url'];
        userModels.created_at = results['users']['created_at'];
        userModels.updated_at = results['users']['updated_at'];

        //Social media.
        userModels.scmFacebook = results['socmed']['socmed_facebook'];
        userModels.scmYoutube = results['socmed']['socmed_youtube'];
        userModels.scmTiktok = results['socmed']['socmed_tiktok'];
        userModels.scmInstagram = results['socmed']['socmed_instagram'];
        userModels.scmLinkedIn = results['socmed']['socmed_linkedin'];

        _userList.add(userModels);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getFullProfile();
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
          height: fullHeight,
          child: ListView.builder(
              padding: EdgeInsets.only(top: fullHeight * 0.07),
              itemCount: _userList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                            'assets/storage/${_userList[index].image_url}',
                            width: 200),
                      ),
                    ),
                    //Profile
                    Container(
                        margin: const EdgeInsets.all(10),
                        width: fullWidth,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 128, 128, 128)
                                  .withOpacity(0.25),
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
                          children: [
                            const Text("Username",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _usernameCtrl,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].username,
                                ),
                              ),
                            ),
                            const Text("Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _emailCtrl,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].email,
                                ),
                              ),
                            ),
                            const Text("Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _passwordCtrl,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].password,
                                ),
                              ),
                            ),
                            const Text("Country",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _countryCtrl,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].country,
                                ),
                              ),
                            ),
                            const Text("Description",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _descriptionCtrl,
                                enableSuggestions: false,
                                autocorrect: false,
                                maxLines: 8,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].description,
                                ),
                              ),
                            ),
                            Row(children: [
                              ElevatedButton.icon(
                                onPressed: () async {
                                  //Initial variable.
                                  var username = "";
                                  var email = "";
                                  var password = "";
                                  var country = "";
                                  var description = "";

                                  //Update profile
                                  var connection = await setDatabase();
                                  var date = DateFormat("yyyy-MM-dd h:m:s")
                                      .format(DateTime.now())
                                      .toString();

                                  //Validate empty
                                  if (_usernameCtrl.text.isEmpty) {
                                    username = _userList[index].username;
                                  } else {
                                    username = _usernameCtrl.text;
                                  }
                                  if ((_emailCtrl.text.isEmpty) &&
                                      (_passwordCtrl.text.length < 10)) {
                                    email = _userList[index].email;
                                  } else {
                                    email = _emailCtrl.text;
                                  }
                                  if ((_passwordCtrl.text.isEmpty) &&
                                      (_passwordCtrl.text.length < 6)) {
                                    password = _userList[index].password;
                                  } else {
                                    password = _passwordCtrl.text;
                                  }
                                  if (_descriptionCtrl.text.isEmpty) {
                                    description = _userList[index].description;
                                  } else {
                                    description = _descriptionCtrl.text;
                                  }
                                  if (_countryCtrl.text.isEmpty) {
                                    country = _userList[index].country;
                                  } else {
                                    country = _countryCtrl.text;
                                  }

                                  await connection.execute(
                                      "UPDATE public.users SET username='${username}', email='${email}', password='${password}', description='${description}', country='${country}', updated_at='${date}' "
                                      "WHERE id = ${passIdUser};");
                                },
                                icon: const Icon(Icons.save, size: 18),
                                label: const Text("Update"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green, // Background color
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Column(children: [
                                  Text(
                                      "Joined Since ${DateFormat("yyyy-MM-dd h:m:s").format(_userList[index].created_at)}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF414141),
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      "Last Updated ${DateFormat("yyyy-MM-dd h:m:s").format(_userList[index].updated_at)}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF414141),
                                          fontWeight: FontWeight.bold))
                                ]),
                              )
                            ])
                          ],
                        )),
                    //Profile
                    Container(
                        margin: const EdgeInsets.all(10),
                        width: fullWidth,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 128, 128, 128)
                                  .withOpacity(0.25),
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
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.facebook, size: 24),
                                  ),
                                  TextSpan(
                                      text: " Facebook",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _scmFacebook,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].scmFacebook,
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.play_arrow,
                                        size: 24), //Youtube icon not available
                                  ),
                                  TextSpan(
                                      text: " Youtube",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _scmYoutube,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].scmYoutube,
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.tiktok, size: 24),
                                  ),
                                  TextSpan(
                                      text: " Tiktok",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _scmTiktok,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].scmTiktok,
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.camera,
                                        size:
                                            24), //Instagram icon not available
                                  ),
                                  TextSpan(
                                      text: " Instagram",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _scmInstagram,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].scmInstagram,
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.insert_chart_rounded,
                                        size: 24), //Linkedin icon not available
                                  ),
                                  TextSpan(
                                      text: " LinkedIn",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 40,
                              child: TextField(
                                controller: _scmLinkedin,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        width: 2.0),
                                  ),
                                  hintText: _userList[index].scmLinkedIn,
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                //Initial variable.
                                var facebook = "";
                                var youtube = "";
                                var tiktok = "";
                                var instagram = "";
                                var linkedin = "";

                                //Update social media
                                var connection = await setDatabase();
                                var date = DateFormat("yyyy-MM-dd h:m:s")
                                    .format(DateTime.now())
                                    .toString();

                                //Validate empty
                                if (_scmFacebook.text.isEmpty) {
                                  facebook = _userList[index].scmFacebook;
                                } else {
                                  facebook = _scmFacebook.text;
                                }
                                if (_scmYoutube.text.isEmpty) {
                                  youtube = _userList[index].scmYoutube;
                                } else {
                                  youtube = _scmYoutube.text;
                                }
                                if (_scmTiktok.text.isEmpty) {
                                  tiktok = _userList[index].scmTiktok;
                                } else {
                                  tiktok = _scmTiktok.text;
                                }
                                if (_scmInstagram.text.isEmpty) {
                                  instagram = _userList[index].scmInstagram;
                                } else {
                                  instagram = _scmInstagram.text;
                                }
                                if (_scmLinkedin.text.isEmpty) {
                                  linkedin = _userList[index].scmLinkedIn;
                                } else {
                                  linkedin = _scmLinkedin.text;
                                }

                                await connection.execute(
                                    "UPDATE public.socmed SET socmed_facebook='${facebook}', socmed_youtube='${youtube}', socmed_tiktok='${tiktok}', socmed_instagram='${instagram}', socmed_linkedin='${linkedin}', updated_at='${date}' "
                                    "WHERE id = ${passIdUser};");
                              },
                              icon: const Icon(Icons.save, size: 18),
                              label: const Text("Update"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green, // Background color
                              ),
                            ),
                          ],
                        ))
                  ],
                );
              })),
    );
  }
}
