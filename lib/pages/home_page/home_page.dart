import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ub/pages/home_page/screens/message_screen.dart';

import 'screens/diagram_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<HomePage> {
  List<bool> navigationPressed;
  Widget body;
  PageController _pageController;
  @override
  void initState() {
    navigationPressed = List.generate(4, (index) => false);
    navigationPressed[3] = true;

    body = ProfileScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          brightness: Brightness.light,
          elevation: 0.0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 1),
            width: 360,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    iconSize: 25,
                    icon: SvgPicture.asset(
                      navigationPressed[0]
                          ? 'assets/icons/message_blue.svg'
                          : 'assets/icons/message_grey.svg',
                    ),
                    onPressed: () {
                      setState(() {
                        body = MessageScreen();
                        navigationPressed[0] = true;
                        navigationPressed[1] = false;
                        navigationPressed[2] = false;
                        navigationPressed[3] = false;
                      });
                    }),
                IconButton(
                    iconSize: 25,
                    icon: SvgPicture.asset(navigationPressed[1]
                        ? 'assets/icons/diagram_blue.svg'
                        : 'assets/icons/diagram_grey.svg'),
                    onPressed: () {
                      setState(() {
                        body = DiagramScreen();
                        navigationPressed[0] = false;
                        navigationPressed[1] = true;
                        navigationPressed[2] = false;
                        navigationPressed[3] = false;
                      });
                    }),
                IconButton(
                    iconSize: 25,
                    icon: SvgPicture.asset(navigationPressed[2]
                        ? 'assets/icons/home_blue.svg'
                        : 'assets/icons/home_grey.svg'),
                    onPressed: () {
                      setState(() {
                        body = HomeScreen();
                        navigationPressed[0] = false;
                        navigationPressed[1] = false;
                        navigationPressed[2] = true;
                        navigationPressed[3] = false;
                      });
                    }),
                IconButton(
                    iconSize: 25,
                    icon: SvgPicture.asset(navigationPressed[3]
                        ? 'assets/icons/profile_blue.svg'
                        : 'assets/icons/profile_grey.svg'),
                    onPressed: () {
                      setState(() {
                        body = ProfileScreen();
                        navigationPressed[0] = false;
                        navigationPressed[1] = false;
                        navigationPressed[2] = false;
                        navigationPressed[3] = true;
                      });
                    }),
              ],
            ),
          ),
        ),
        body: body);
  }
}
