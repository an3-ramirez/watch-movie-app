import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/providers/auth_provider.dart';

import 'package:watch_movie_app/src/routes/pages.dart';
import 'package:watch_movie_app/src/helpers/palette.dart';

class MovieApp extends ConsumerWidget {
  const MovieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = ref.watch(authProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Movie App',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Palette.kToDark,
      ),
      initialRoute: isLogin ? Pages.HOME : Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}
