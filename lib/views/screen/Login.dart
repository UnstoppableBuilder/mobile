import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ub/views/utils/Colors.dart';
import 'package:ub/views/utils/Constant.dart';
import 'package:ub/views/utils/Images.dart';
import 'package:ub/views/utils/Strings.dart';
import 'package:ub/views/utils/Widget.dart';
import 'package:ub/main/utils/AppWidget.dart';

import '../../main.dart';
import 'Dashboard.dart';
import 'Signup.dart';

class Login extends StatefulWidget {
  static var tag = "/SignIn";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) => Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  Image.asset(t1_ic_ring, height: 100, width: 100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      formHeading(t1_lbl_sign_in_header),
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup())),
                          child: formSubHeadingForm(t1_lbl_sign_up)),
                    ],
                  ),
                  SizedBox(height: 50),
                  editTextStyle(t1_user_name, isPassword: false),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_password, isPassword: true),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: CustomTheme(
                      child: CheckboxListTile(
                        title: text(t1_lbl_remember,
                            textColor: appStore.textSecondaryColor),
                        value: rememberMe,
                        onChanged: (newValue) {
                          rememberMe = newValue;
                          setState(() {});
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                      padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                      child: shadowButton(
                          t1_lbl_sign_in,
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard())))),
                  SizedBox(height: 24),
                  text(t1_lbl_forgot_password,
                      textColor: appStore.textPrimaryColor,
                      fontFamily: fontMedium)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
