import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ub/main/utils/AppWidget.dart';
import 'package:ub/views/utils/Colors.dart';
import 'package:ub/views/utils/Constant.dart';

class Walkthrough extends StatefulWidget {
  final title;
  final content;
  final imageIcon;
  final imagecolor;
  final logoIcon;

  Walkthrough(
      {this.title,
      this.content,
      this.imageIcon,
      this.imagecolor = Colors.redAccent,
      this.logoIcon});

  @override
  WalkthroughState createState() {
    return new WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //const SizedBox(height: 15),
        // SvgPicture.asset(
        //   widget.logoIcon,
        //   //color: t1_colorPrimary,
        //   height: 199,
        // ),
        SizedBox(height: height * 0.37),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: text(widget.content,
              maxLine: 2,
              fontSize: textSizeMedium,
              fontFamily: 'Roboto',
              isCentered: true,
              textColor: t1_colorAccent),
        ),
        // SizedBox(height: 30),
        // SvgPicture.asset(
        //   widget.imageIcon,
        //   width: MediaQuery.of(context).size.width,
        // ),
      ],
    );
  }
}
