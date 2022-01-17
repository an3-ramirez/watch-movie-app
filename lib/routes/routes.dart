import 'package:flutter/material.dart';
import 'package:watch_movie_app/pages/favorite_page.dart';
import 'package:watch_movie_app/pages/home_page.dart';

/** Pages */
import 'package:watch_movie_app/pages/login_page.dart';
import 'package:watch_movie_app/pages/recent_page.dart';
import 'package:watch_movie_app/pages/recent_detail_page.dart';
import 'package:watch_movie_app/pages/serie_detail_page.dart';
import 'package:watch_movie_app/pages/serie_page.dart';
import 'package:watch_movie_app/pages/welcome_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'welcome': (_) => WelcomePage(),
  'login': (_) => LoginPage(),
  'home': (_) => HomePage(),
  'serie': (_) => SeriePage(),
  'serie-detail': (_) => SerieDetailPage(),
  'recent': (_) => RecentPage(),
  'recent-detail': (_) => RecentDetailPage(),
  'favorite': (_) => FavoritePage(),
};
