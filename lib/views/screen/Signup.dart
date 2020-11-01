import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ub/data/data_provider.dart';
import 'package:ub/views/screen/Dashboard.dart';
import 'package:ub/views/screen/Login.dart';
import 'package:ub/views/screen/Sidemenu.dart';
import 'package:ub/views/utils/Colors.dart';
import 'package:ub/views/utils/Constant.dart';
import 'package:ub/views/utils/Images.dart';
import 'package:ub/views/utils/Strings.dart';
import 'package:ub/views/utils/Widget.dart';
import 'package:ub/main/utils/AppWidget.dart';

import '../../main.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _signUp();
  }
}

class _signUp extends State<Signup> {
  static var tag = "/SignUp";
  List<TextEditingController> controlers;

  @override
  void initState() {
    controlers = List.generate(5, (index) => TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Observer(
            builder: (_) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  Image.asset(t1_ic_ring, height: 100, width: 100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      formHeading(t1_lbl_sign_up_header),
                      GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login())),
                          child: formSubHeadingForm(t1_lbl_sign_in)),
                    ],
                  ),
                  SizedBox(height: 40),
                  editTextStyle(t1_hint_firstName,
                      isPassword: false, controller: controlers[0]),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_lastName,
                      isPassword: false, controller: controlers[1]),
                  SizedBox(height: 16),
                  editTextStyle(t1_email_phone_no,
                      isPassword: false, controller: controlers[2]),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_password,
                      isPassword: true, controller: controlers[3]),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_re_password,
                      isPassword: true, controller: controlers[4]),
                  SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: shadowButton(t1_lbl_sign_up, () {
                        DataProvider().registerOrLogin(
                            firstName: controlers[0].text,
                            lastName: controlers[1].text,
                            phone: controlers[2].text,
                            code: controlers[3].text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      })),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      text(t1_lbl_already_have_account,
                          textColor: appStore.textSecondaryColor,
                          fontSize: textSizeLargeMedium),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SideMenu())),
                        child: text(t1_lbl_sign_in,
                            fontFamily: fontMedium, textColor: t1_blue),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
