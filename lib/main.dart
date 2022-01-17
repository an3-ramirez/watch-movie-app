import 'package:flutter/material.dart';
import 'package:watch_movie_app/routes/routes.dart';
import 'package:watch_movie_app/utils/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Movie App',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}
