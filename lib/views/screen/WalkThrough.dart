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
        content: "Забыл про каску?\nПримеришь повязку",
        logoIcon: "images/onboarding_top.svg",
        imageIcon: "images/onboarding_bottom.svg"),
    Walkthrough(
        title: "Select Files",
        content:
            "Работать со случайных подставок (ящиков бочек, досок и т.д.) запрещается",
        logoIcon: "images/onboarding_top.svg",
        imageIcon: "images/onboarding_bottom.svg"),
    Walkthrough(
        title: "Share Files",
        content: "Не ставь лестницу на шаткое основание",
        logoIcon: "images/onboarding_top.svg",
        imageIcon: "images/onboarding_bottom.svg"),
    Walkthrough(
        title: "Share Files",
        content: "Не входи в зону работы экскаватора",
        logoIcon: "images/onboarding_top.svg",
        imageIcon: "images/onboarding_bottom.svg"),
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
