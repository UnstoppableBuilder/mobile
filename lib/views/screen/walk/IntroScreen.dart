import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ub/main/utils/AppWidget.dart';
import 'package:ub/main/utils/dots_indicator/dots_indicator.dart';
import 'package:ub/views/utils/Colors.dart';
import 'package:ub/views/utils/Constant.dart';
import 'package:ub/views/utils/Images.dart';

import 'Walkthrough.dart';

class IntroScreen extends StatefulWidget {
  final List<Walkthrough> walkthroughList;
  final MaterialPageRoute pageRoute;

  IntroScreen(this.walkthroughList, this.pageRoute);

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  IntroScreenState createState() {
    return new IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.walkthroughList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            ScrollConfiguration(
              behavior: SBehavior(),
              child: PageView(
                  children: widget.walkthroughList,
                  controller: controller,
                  onPageChanged: _onPageChanged),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 30),
                  DotsIndicator(
                    dotsCount: 4,
                    position: currentPage,
                    decorator: DotsDecorator(
                        size: const Size.square(5.0),
                        activeSize: const Size.square(8.0),
                        color: t1_view_color,
                        activeColor: t1_colorAccent),
                  ),
                  SizedBox(height: height * 0.07),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[]),
                  SvgPicture.asset(
                    "images/onboarding_bottom.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => widget.skipPage(context),
                      child: Container(
                        height: 20,
                        child: Text("Пропустить",
                            style: TextStyle(
                                //color: t1_colorPrimary, // t1_colorPrimary,
                                fontSize: textSizeSMedium)),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
                SvgPicture.asset(
                  "images/onboarding_top.svg",
                  //color: t1_colorPrimary,
                  height: 199,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void info() {
  var currentPage;
  switch (currentPage) {
    case 0:
      Container(
          margin: new EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: Image.asset(t1_walk_top,
              width: 40, height: 40, alignment: Alignment.topRight));
      break;
    case 1:
      Image.asset(t1_walk_top, width: 40, height: 40);
      break;
    case 2:
      Container(
          margin: new EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset(t1_walk_top, width: 40, height: 40));
      break;
    case 3:
      Container(
          margin: new EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset(t1_walk_top, width: 40, height: 40));
      break;
  }
}
