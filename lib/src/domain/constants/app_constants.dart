import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const appName = 'Watch Movie App';
const primaryColor = Color(0xff191919);
const lightColor = Color(0xff8AFFFF);
const accentColor = Color(0xffFFD233);
final optionTextColor = primaryColor.withOpacity(0.7);
const uiOverlayStyle = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
);

const String domainImageNetwork = 'https://image.tmdb.org/t/p/';
