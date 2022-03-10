import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';
import 'package:watch_movie_app/src/ui/helpers.dart';
import 'domain/constants/constants.dart' show appName;
import 'domain/theme/theme.dart';

import 'package:watch_movie_app/src/routes/pages.dart';

class MovieApp extends ConsumerWidget {
  const MovieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(sharedPreferences);

    return AsyncValueWidget(
      value: asyncValue,
      data: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: channelTheme,
        initialRoute: Pages.INITIAL,
        routes: Pages.routes,
      ),
    );
  }
}
