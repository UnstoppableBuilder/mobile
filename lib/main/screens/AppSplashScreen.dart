import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ub/defaultTheme/screen/DTDashboardScreen.dart';
import 'package:ub/main/utils/AppConstant.dart';

class AppSplashScreen extends StatefulWidget {
  static String tag = '/ProkitSplashScreen';

  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  void navigationPage() async {
    await setInt(appOpenCount, (await getInt(appOpenCount)) + 1);

    if (!await isNetworkAvailable()) {
      toastLong(errorInternetNotAvailable);
    }

    await Future.delayed(Duration(seconds: 3));
    if (!isMobile) {
      // Currently we provide web support for only Default Theme
      DTDashboardScreen().launch(context, isNewTask: true);
    }
    // else {
    //   ProKitLauncher().launch(context, isNewTask: true);
    // }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorFromHex('#FFFDF1'),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('images/app/app_icon.png',
            height: 200, fit: BoxFit.fitHeight),
      ),
    );
  }
}
