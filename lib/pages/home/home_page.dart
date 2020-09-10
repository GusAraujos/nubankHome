import 'package:flutter/material.dart';
import 'package:nubank/pages/widgets/my_dots_app.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/page_view_app.dart';
import '../widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
              showMenu: _showMenu,
              ontap: () {
                setState(() {
                  _showMenu = !_showMenu;
                });
              }),
          PageViewApp(
            top: _screenHeight * .22,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            top: _screenHeight * .68,
            child: MyDotsApp(currentIndex: _currentIndex),
          )
        ],
      ),
    );
  }
}
