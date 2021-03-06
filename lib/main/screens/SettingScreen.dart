import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:ub/main/utils/AppColors.dart';
import 'package:ub/main/utils/AppConstant.dart';
import 'package:ub/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class SettingScreen extends StatefulWidget {
  static String tag = '/SettingScreen';

  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 80),
              settingItem(
                context,
                "Пользовательское соглашение",
                onTap: () async {
                  launch(DocumentationUrl,
                      forceWebView: true, enableJavaScript: true);
                },
                leading: Image.asset('images/app/ic_documentation.png',
                    height: 24, width: 24, color: appColorPrimary),
              ),
              Divider(height: 0),
              settingItem(
                context,
                "Политика обработки данных",
                onTap: () async {
                  launch(ChangeLogsUrl,
                      forceWebView: true, enableJavaScript: true);
                },
                leading: Image.asset('images/app/ic_change_log.png',
                    height: 24, width: 24, color: appColorPrimary),
              ),
              Divider(height: 0),
              settingItem(
                context,
                "Поделиться",
                onTap: () async {
                  PackageInfo.fromPlatform().then((value) async {
                    String package = value.packageName;
                    await Share.share(
                        'Download $mainAppName from Play Store\n\n\n$PlayStoreUrl$package');
                  });
                },
                leading: Image.asset('images/app/ic_share.png',
                    height: 24, width: 24, color: appColorPrimary),
              ),
              // Divider(height: 0),
              // settingItem(
              //   context,
              //   "Rate us",
              //   onTap: () {
              //     PackageInfo.fromPlatform().then((value) async {
              //       String package = value.packageName;
              //       launch('$PlayStoreUrl$package');
              //     });
              //   },
              //   leading: Image.asset('images/app/ic_rate_app.png',
              //       height: 24, width: 24, color: appColorPrimary),
              // ),
              Divider(height: 0),
              settingItem(
                context,
                "Темная тема",
                onTap: () {
                  appStore.toggleDarkMode();
                  setState(() {});
                },
                leading: Image.asset('images/app/ic_theme.png',
                    height: 24, width: 24, color: appColorPrimary),
                detail: Switch(
                  value: appStore.isDarkModeOn,
                  onChanged: (s) {
                    appStore.toggleDarkMode(value: s);
                    setState(() {});
                  },
                ).withHeight(24),
              ),
              Divider(height: 0),
            ],
          ),
          Positioned(bottom: 0, child: AdMobAdWidget()),
        ],
      ),
    );
  }
}
