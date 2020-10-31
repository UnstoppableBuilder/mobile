import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ub/main/utils/AppWidget.dart';
import 'package:ub/views/screen/Signup.dart';
import 'package:ub/views/screen/walk/IntroScreen.dart';
import 'package:ub/views/screen/walk/Walkthrough.dart';
import 'package:ub/views/utils/Images.dart';

import '../../main.dart';

class WalkThrough extends StatelessWidget {
  static var tag = "/WalkThrough";

  final List<Walkthrough> list = [
    Walkthrough(
        title: "Add Files",
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
        imageIcon: t1_walk1),
    Walkthrough(
        title: "Select Files",
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
        imageIcon: t1_walk2),
    Walkthrough(
        title: "Share Files",
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
        imageIcon: t1_walk3),
  ];

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
      body: Container(
        child: IntroScreen(
          list,
          MaterialPageRoute(builder: (context) => Signup()),
        ),
      ),
    );
  }
}
