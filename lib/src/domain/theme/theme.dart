import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:watch_movie_app/src/helpers/palette.dart';

import '../constants/constants.dart';

ThemeData channelTheme = ThemeData(
  fontFamily: 'Gilroy',
  primarySwatch: Palette.getMaterialColorFromColor(lightColor),
  primaryTextTheme: const TextTheme(headline6: TextStyle(color: lightColor)),
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: lightColor),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: lightColor,
    centerTitle: true,
    elevation: 0,
    toolbarHeight: kToolbarHeight,
    systemOverlayStyle: uiOverlayStyle,
  ),
  scaffoldBackgroundColor: primaryColor,
);
