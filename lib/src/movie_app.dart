import 'package:flutter/material.dart';
import 'domain/constants/constants.dart' show appName;
import 'domain/theme/theme.dart';

import 'package:watch_movie_app/src/routes/pages.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: channelTheme,
      initialRoute: Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}
