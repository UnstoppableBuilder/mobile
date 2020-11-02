import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ub/main/utils/AppWidget.dart';
import 'package:ub/views/utils/Colors.dart';
import 'package:ub/views/utils/Images.dart';
import 'package:ub/views/utils/Strings.dart';
import 'package:ub/views/utils/Widget.dart';

import '../../main.dart';

class BottomNavigation extends StatefulWidget {
  static var tag = "/BottomNavigation";

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  var isSelected = 1;

  @override
  Widget build(BuildContext context) {
    Widget tabItem(var pos, var icon) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = pos;
          });
        },
        child: Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: isSelected == pos
              ? BoxDecoration(
                  shape: BoxShape.circle, color: t1_colorPrimary_light)
              : BoxDecoration(),
          child: SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: isSelected == pos
                ? t1_colorPrimary
                : appStore.textSecondaryColor,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appBar(context, t1_bottom_navigation),
      body: Observer(
        builder: (_) =>
            ring(t1_lbl_welcome_to_bottom_n_navigation_baar).center(),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 60,
            decoration: BoxDecoration(
              color: appStore.scaffoldBackground,
              boxShadow: [
                BoxShadow(
                    color: shadowColorGlobal,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 3.0)),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  tabItem(1, t1_home),
                  tabItem(2, t1_notification),
                  Container(width: 45, height: 45),
                  tabItem(3, t1_settings),
                  tabItem(4, t1_user),
                ],
              ),
            ),
          ),
          Container(
            child: FloatingActionButton(
              backgroundColor: t1_colorPrimary,
              onPressed: () {
                //
              },
              child: Icon(Icons.mic, color: t1_white),
            ),
          )
        ],
      ),
    );
  }
}
