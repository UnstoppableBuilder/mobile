//region imports
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ub/main/store/AppStore.dart';
import 'package:ub/main/utils/AppTheme.dart';
import 'package:ub/theme1/screen/T1Signup.dart';
import 'package:ub/theme1/screen/T1WalkThrough.dart';

import 'main/utils/AppConstant.dart';
import 'main/utils/AppWidget.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appStore.toggleDarkMode(value: await getBool(isDarkModeOnPref));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localeResolutionCallback: (locale, supportedLocales) =>
            Locale(appStore.selectedLanguage),
        locale: Locale(appStore.selectedLanguage),
        supportedLocales: [Locale('en', '')],
        //routes: routes(),
        title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
        home: T1Signup(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        builder: (context, child) =>
            ScrollConfiguration(behavior: SBehavior(), child: child),
      ),
    );
  }
}
