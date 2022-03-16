import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';
import 'package:watch_movie_app/src/ui/global_widgets/async_value_widget.dart';
import 'domain/constants/constants.dart' show appName;
import 'domain/theme/theme.dart';

import 'package:watch_movie_app/src/routes/pages.dart';

class MovieApp extends ConsumerWidget {
  const MovieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(userIsLoggedProvider);

    return AsyncValueWidget(
      value: asyncValue,
      data: (bool userLogeed) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: channelTheme,
        initialRoute: userLogeed ? Pages.HOME : Pages.INITIAL,
        routes: Pages.routes,
      ),
    );
  }
}
