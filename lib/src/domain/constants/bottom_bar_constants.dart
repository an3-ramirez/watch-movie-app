import 'package:flutter/material.dart';

/** pages */
import 'package:watch_movie_app/src/ui/pages/home/home_page.dart';

List barItems = [
  {"icon": Icons.home_filled, "page": const HomePage(), "title": "Home"},
  {"icon": Icons.favorite_outline, "page": Container(), "title": "Favorites"},
  {"icon": Icons.replay_outlined, "page": Container(), "title": "Recent"},
  {"icon": Icons.search, "page": Container(), "title": "Search"},
];
