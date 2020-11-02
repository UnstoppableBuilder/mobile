import 'dart:ui';

import 'package:flutter/material.dart';

const Color t1_colorPrimary = Color(0xFF7978F4);
const Color t1_colorPrimary_light = Color(0xFFFFFFFF);
const Color t1_colorPrimaryDark = Color(0xFF00BBC4);
const Color t1_colorAccent = Color(0xFF00BBC4);

const Color t1_app_background = Color(0xFFf8f8f8);
const Color t1_view_color = Color(0xFFDADADA);

const Color t1_sign_in_background = Color(0xFFDADADA);

const Color t1_white = Color(0xFFffffff);
const Color t1_icon_color = Color(0xFF747474);
const Color t1_selected_tab = Color(0xFFFCE9E9);
const Color t1_red = Color(0xFFF10202);
const Color t1_blue = Color(0xFF1D36C0);
const Color t1_edit_text_background = Color(0xFFE8E8E8);
const Color t1_shadow = Color(0x70E2E2E5);
MaterialColor t1White = materialColor(0xFFFFFFFF);
MaterialColor t1TextColorPrimary = materialColor(0xFF212121);
const shadow_color = Color(0x95E9EBF0);
const t1_color_primary_light = Color(0xFFFCE8E8);
const t1_bg_bottom_sheet = Color(0xFFFFF1F1);

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0xFF5959fc, color);
