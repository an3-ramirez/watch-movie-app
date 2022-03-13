// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:watch_movie_app/src/routes/routes.dart';

/** Pages */
import 'package:watch_movie_app/src/ui/pages/root_page.dart';
import 'package:watch_movie_app/src/ui/pages/home/home_page.dart';
import 'package:watch_movie_app/src/ui/pages/loader/loading_page.dart';
import 'package:watch_movie_app/src/ui/pages/login/login_page.dart';
import 'package:watch_movie_app/src/ui/pages/recent/recent_page.dart';
import 'package:watch_movie_app/src/ui/pages/recent_detail/recent_detail_page.dart';
import 'package:watch_movie_app/src/ui/pages/serie/serie_page.dart';
import 'package:watch_movie_app/src/ui/pages/serie_detail.dart/serie_detail_page.dart';
import 'package:watch_movie_app/src/ui/pages/welcome/welcome_page.dart';
import 'package:watch_movie_app/src/ui/pages/fovorite/favorite_page.dart';

abstract class Pages {
  static const String INITIAL = Routes.LOADING;
  static const String HOME = Routes.HOME;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.LOADING: (_) => const LoadingPage(),
    Routes.ROOT: (_) => const RootPage(),
    Routes.WELCOME: (_) => const WelcomePage(),
    Routes.LOGIN: (_) => LoginPage(),
    Routes.HOME: (_) => const HomePage(),
    Routes.SERIE: (_) => const SeriePage(),
    Routes.SERIE_DETAIL: (_) => SerieDetailPage(),
    Routes.RECENT: (_) => RecentPage(),
    Routes.RECENT_DETAIL: (_) => RecentDetailPage(),
    Routes.FAVORITE: (_) => FavoritePage()
  };
}
