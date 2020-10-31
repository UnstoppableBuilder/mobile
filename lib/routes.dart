import 'package:flutter/material.dart';
import 'package:ub/main/model/AppModel.dart';
import 'package:ub/main/screens/ProKitScreenListing.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ProKitScreenListing.tag: (context) => ProKitScreenListing(ProTheme()),
  };
}
