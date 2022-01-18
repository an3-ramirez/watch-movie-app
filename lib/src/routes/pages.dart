import 'package:flutter/cupertino.dart';

import 'package:watch_movie_app/src/routes/routes.dart';

/** Pages */
import 'package:watch_movie_app/src/ui/pages/home_page.dart';
import 'package:watch_movie_app/src/ui/pages/login_page.dart';
import 'package:watch_movie_app/src/ui/pages/recent_page.dart';
import 'package:watch_movie_app/src/ui/pages/recent_detail_page.dart';
import 'package:watch_movie_app/src/ui/pages/serie_detail_page.dart';
import 'package:watch_movie_app/src/ui/pages/serie_page.dart';
import 'package:watch_movie_app/src/ui/pages/welcome_page.dart';
import 'package:watch_movie_app/src/ui/pages/favorite_page.dart';

abstract class Pages {
  static const String INITIAL = Routes.WELCOME;
  static const String HOME = Routes.HOME;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.WELCOME: (_) => WelcomePage(),
    Routes.LOGIN: (_) => LoginPage(),
    Routes.HOME: (_) => HomePage(),
    Routes.SERIE: (_) => SeriePage(),
    Routes.SERIE_DETAIL: (_) => SerieDetailPage(),
    Routes.RECENT: (_) => RecentPage(),
    Routes.RECENT_DETAIL: (_) => RecentDetailPage(),
    Routes.FAVORITE: (_) => FavoritePage()
  };
}
