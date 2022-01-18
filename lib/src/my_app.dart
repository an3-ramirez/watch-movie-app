import 'package:flutter/material.dart';

import 'package:watch_movie_app/src/routes/pages.dart';
import 'package:watch_movie_app/src/helpers/palette.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Movie App',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Palette.kToDark,
      ),
      initialRoute: Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}
