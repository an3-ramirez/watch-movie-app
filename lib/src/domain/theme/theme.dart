import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:watch_movie_app/src/helpers/palette.dart';

import '../constants/constants.dart';

ThemeData channelTheme = ThemeData(
  fontFamily: 'Gilroy',
  primarySwatch: Palette.getMaterialColorFromColor(primaryColor),
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    centerTitle: true,
    elevation: 0,
    toolbarHeight: 65,
    systemOverlayStyle: uiOverlayStyle,
  ),
  scaffoldBackgroundColor: primaryColor,
);
