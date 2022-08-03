import 'package:culineira/community/CommunityPage.dart';
import 'package:culineira/kitchen/MyKitchenPage.dart';
import 'package:culineira/profile/ProfilePage.dart';
import 'package:culineira/recipe/RecipesPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
    runApp(const MyApp());
}

var primaryColor = const Color(0xFFEB7336);
var mainbg = const Color(0xFFFFF4EB);
var iconMainColor = const Color(0xFF2F4858);

class MyApp extends StatelessWidget {
    const MyApp({Key key}) : super(key: key);
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: mainbg),
      home: const NavBar(),
    );
    }
}

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);
  
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      const RecipesPage(),
      const MyKitchenPage(),
      const CommunityPage(),
      const ProfilePage(),
    ];
    return Scaffold(
    bottomNavigationBar: CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 60.0,
      items: <Widget>[
        Icon(Icons.book, size: 30, color: mainbg),
        Icon(Icons.kitchen, size: 30, color: mainbg),
        Icon(Icons.group, size: 30, color: mainbg),
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(18), // Image radius
            child: Image.asset('assets/image/users/user_rosemonde.jpg', fit: BoxFit.cover),
          ),
        ),
      ],
      buttonBackgroundColor: primaryColor,
      backgroundColor: mainbg,
      color: primaryColor,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
      letIndexChange: (index) => true,
    ),
    body: _widgetOptions.elementAt(_page)
    );
  }
}
